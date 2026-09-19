require 'date'
require 'digest'
require 'json'
require 'open3'
require 'yaml'

WORKFLOW = '.github/workflows/packages.yml'.freeze

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

def pipeline(sha)
  contents = command('git', 'show', "#{sha}:#{WORKFLOW}")
  document = YAML.safe_load(contents, permitted_classes: [Date, Time], aliases: true)
  document.delete('on')
  document.delete(true)
  document
end

def workflow(sha)
  document = pipeline(sha)
  document.fetch('jobs').delete('publish')
  document
end

def same_inputs?(source, target)
  %w[packages engine-revision .github/actions .github/scripts].all? do |path|
    command('git', 'rev-parse', "#{source}:#{path}") == command('git', 'rev-parse', "#{target}:#{path}")
  end
end

def merged_heads(repository, target)
  commits = command('git', 'rev-list', '--first-parent', '--max-count=20', target).lines.map(&:strip)
  commits.take_while { |commit| same_inputs?(commit, target) }.flat_map do |commit|
    api("repos/#{repository}/commits/#{commit}/pulls").map do |pull|
      next unless pull['merged_at'] && pull['merge_commit_sha'] == commit
      next unless pull.dig('head', 'repo', 'full_name') == repository

      head = revision(pull.fetch('head').fetch('sha'))
      fetch_commit(head)
      base = revision(command('git', 'merge-base', head, "#{commit}^1").strip)
      [head, base]
    end.compact
  end
end

def select_run(repository, target)
  return nil if ENV['RECHECK'] == 'true'

  trusted_workflow = workflow(target)
  merged_heads(repository, target).each do |head, base|
    next unless same_inputs?(head, target) && workflow(head) == trusted_workflow
    next unless pipeline(head) == pipeline(base)
    next unless workflow(base) == trusted_workflow
    next unless command('git', 'rev-parse', "#{base}:.github/actions") == command('git', 'rev-parse', "#{target}:.github/actions")

    runs = api("repos/#{repository}/actions/workflows/packages.yml/runs?event=pull_request&status=success&head_sha=#{head}&per_page=100")
    runs.fetch('workflow_runs').each do |run|
      next unless run['head_sha'] == head && run['event'] == 'pull_request'
      next unless run['path'] == WORKFLOW && run['status'] == 'completed' && run['conclusion'] == 'success'
      next unless run.dig('head_repository', 'full_name') == repository

      artifacts = api("repos/#{repository}/actions/runs/#{run.fetch('id')}/artifacts?per_page=100")
      bundles = artifacts.fetch('artifacts').select { |artifact| artifact['name'] == 'verified-bundle' && !artifact['expired'] }
      next unless bundles.length == 1 && bundles.first.fetch('digest', '').match?(/\Asha256:[0-9a-f]{64}\z/)

      return run.fetch('id')
    end
  end
  nil
end

def download_bundle(repository, run_id, destination, name = 'verified-bundle')
  raise 'invalid run ID' unless run_id.match?(/\A[0-9]+\z/)

  artifacts = api("repos/#{repository}/actions/runs/#{run_id}/artifacts?per_page=100")
  bundles = artifacts.fetch('artifacts').select { |artifact| artifact['name'] == name && !artifact['expired'] }
  raise 'expected one retained verified bundle' unless bundles.length == 1

  artifact = bundles.first
  digest = artifact.fetch('digest')
  raise 'artifact has no SHA-256 digest' unless digest.match?(/\Asha256:[0-9a-f]{64}\z/)

  archive = File.join(ENV.fetch('RUNNER_TEMP'), "#{name}.zip")
  File.open(archive, 'wb') do |file|
    success = system('gh', 'api', "repos/#{repository}/actions/artifacts/#{artifact.fetch('id')}/zip", '--allow-escape-sequences', out: file)
    raise 'bundle download failed' unless success
  end
  raise 'bundle digest mismatch' unless Digest::SHA256.file(archive).hexdigest == digest.delete_prefix('sha256:')

  Dir.mkdir(destination)
  command('unzip', '-q', archive, '-d', destination)
end

if $PROGRAM_NAME == __FILE__
  repository = ENV.fetch('GITHUB_REPOSITORY')
  raise 'publication must run on main' unless ENV.fetch('GITHUB_REF') == 'refs/heads/main'

  case ARGV.fetch(0)
  when 'select'
    run_id = select_run(repository, revision(ENV.fetch('GITHUB_SHA')))
    File.open(ENV.fetch('GITHUB_OUTPUT'), 'a') { |file| file.puts("run_id=#{run_id}") }
    puts(run_id ? "Reuse verified bundle from run #{run_id}" : 'No matching verified bundle; build current inputs')
  when 'download'
    download_bundle(repository, ENV.fetch('SOURCE_RUN'), 'bundle')
  else
    raise 'expected select or download'
  end
end
