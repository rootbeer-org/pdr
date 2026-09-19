require 'fileutils'
require 'json'
require 'open3'

def command(*args)
  output, error, status = Open3.capture3(*args)
  raise "#{args.first} failed: #{error}" unless status.success?

  output
end

def api(path)
  JSON.parse(command('gh', 'api', path))
end

def revision(value)
  raise 'invalid commit SHA' unless value.match?(/\A[0-9a-f]{40}\z/)

  value
end

def fetch_commit(sha)
  revision(sha)
  return if system('git', 'cat-file', '-e', "#{sha}^{commit}", out: File::NULL, err: File::NULL)

  command('git', 'fetch', '--no-tags', 'origin', sha)
end

def same_inputs?(source, target)
  %w[packages engine-revision .github/actions .github/scripts].all? do |path|
    command('git', 'rev-parse', "#{source}:#{path}") == command('git', 'rev-parse', "#{target}:#{path}")
  end
end

def discovery_run?(run, repository)
  run['path'] == '.github/workflows/discovery.yml' &&
    run['head_repository']['full_name'] == repository && run['head_branch'] == 'main' &&
    %w[push schedule workflow_dispatch repository_dispatch].include?(run['event']) &&
    run['status'] == 'completed' && run['conclusion'] == 'success'
end

def same_discovery_inputs?(source, target)
  same_inputs?(source, target) && %w[.github/workflows .github/scripts].all? do |path|
    command('git', 'rev-parse', "#{source}:#{path}") == command('git', 'rev-parse', "#{target}:#{path}")
  end
end

def candidate_names(report)
  names = (report.fetch('updated') + report.fetch('rules_changed')).uniq.sort
  raise 'invalid candidate name' unless names.all? { |name| name.match?(/\A[a-z0-9][a-z0-9+._-]*\z/) }

  names
end

def promote(repository, run_id, retained)
  raise 'invalid run ID' unless run_id.match?(/\A[0-9]+\z/)

  run = api("repos/#{repository}/actions/runs/#{run_id}")
  raise 'untrusted discovery run' unless discovery_run?(run, repository)

  source = revision(run.fetch('head_sha'))
  fetch_commit(source)
  target = revision(command('git', 'rev-parse', 'HEAD').strip)
  is_retry = command('git', 'show', '-s', '--format=%B', target).lines.map(&:strip).include?("Verified-Discovery-Run: #{run_id}") &&
             same_discovery_inputs?(source, "#{target}^")
  unless same_discovery_inputs?(source, target) || is_retry
    puts 'Discovery inputs have changed; a fresh scan will qualify the new catalog'
    return nil
  end

  candidates = File.join(retained, 'discovery')
  names = candidate_names(JSON.parse(File.read(File.join(candidates, 'report.json'))))
  return nil if names.empty?

  bundle = File.join(retained, 'bundle')
  engine = 'engine/target/release/rootbeer-forge'
  command(engine, '--catalog', File.join(candidates, 'packages'), 'verify-candidate', bundle)
  expected = JSON.parse(command(engine, '--catalog', File.join(candidates, 'packages'), 'index'))
  actual = JSON.parse(File.read(File.join(bundle, 'index.json'))).fetch('catalog')
  raise 'candidate recipes differ from verified bundle' unless expected == actual

  paths = names.map { |name| "packages/#{name}.lua" }
  paths.each do |path|
    candidate = File.join(candidates, path)
    raise 'candidate is not a regular file' unless File.file?(candidate) && !File.symlink?(candidate)
    raise 'updates must refer to existing recipes' unless File.file?(path) && !File.symlink?(path)

    FileUtils.cp(candidate, path)
  end
  approved = JSON.parse(command(engine, '--catalog', 'packages', 'index'))
  raise 'candidate report omits recipe changes' unless approved == actual

  command('git', 'config', 'user.name', 'github-actions[bot]')
  command('git', 'config', 'user.email', '41898282+github-actions[bot]@users.noreply.github.com')
  command('git', 'add', '--', *paths)
  return is_retry ? target : nil if system('git', 'diff', '--cached', '--quiet')
  raise 'promoted recipes changed during retry' if is_retry

  command('git', 'commit', '-m', 'chore(packages): advance verified upstream updates',
          '-m', "Verified-Discovery-Run: #{run_id}")
  command('git', 'push', 'origin', 'HEAD:main')
  command('git', 'rev-parse', 'HEAD').strip
end

if $PROGRAM_NAME == __FILE__
  repository = ENV.fetch('GITHUB_REPOSITORY')
  raise 'promotion must run on main' unless ENV.fetch('GITHUB_REF') == 'refs/heads/main'

  sha = promote(repository, ENV.fetch('DISCOVERY_RUN'), ENV.fetch('RETAINED_CANDIDATE'))
  File.open(ENV.fetch('GITHUB_OUTPUT'), 'a') do |file|
    file.puts("revision=#{sha}")
    file.puts("ready=#{!sha.nil?}")
    file.puts("run_id=#{sha ? ENV.fetch('DISCOVERY_RUN') : ''}")
  end
end
