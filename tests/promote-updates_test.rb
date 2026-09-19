require 'minitest/autorun'
require 'tmpdir'
require_relative '../.github/scripts/promote-updates'

class PromotionTest < Minitest::Test
  def run_metadata
    {
      'path' => '.github/workflows/discovery.yml', 'head_branch' => 'main',
      'head_repository' => { 'full_name' => 'owner/index' }, 'event' => 'schedule',
      'status' => 'completed', 'conclusion' => 'success'
    }
  end

  def test_only_successful_trusted_main_discovery_can_promote
    assert discovery_run?(run_metadata, 'owner/index')
    %w[pull_request pull_request_target].each do |event|
      refute discovery_run?(run_metadata.merge('event' => event), 'owner/index')
    end
    refute discovery_run?(run_metadata.merge('head_branch' => 'feature'), 'owner/index')
    refute discovery_run?(run_metadata.merge('conclusion' => 'failure'), 'owner/index')
    refute discovery_run?(run_metadata, 'another/index')
    refute discovery_run?(run_metadata.merge('path' => '.github/workflows/other.yml'), 'owner/index')
  end

  def test_candidate_names_include_rules_only_changes_and_reject_paths
    assert_equal %w[foo tool], candidate_names('updated' => ['tool'], 'rules_changed' => %w[foo tool])
    assert_raises(RuntimeError) { candidate_names('updated' => ['../tool'], 'rules_changed' => []) }
  end

  def test_promotion_rejects_changed_recipes_engine_actions_and_pipeline
    Dir.mktmpdir do |directory|
      Dir.chdir(directory) do
        command('git', 'init', '-q')
        command('git', 'config', 'commit.gpgsign', 'false')
        command('git', 'config', 'user.name', 'Test')
        command('git', 'config', 'user.email', 'test@example.com')
        paths = %w[packages/tool.lua engine-revision .github/actions/setup/action.yml .github/workflows/discovery.yml .github/scripts/promote-updates.rb]
        paths.each do |path|
          FileUtils.mkdir_p(File.dirname(path))
          File.write(path, 'original')
        end
        command('git', 'add', '.')
        command('git', 'commit', '-qm', 'initial')
        original = command('git', 'rev-parse', 'HEAD').strip
        File.write('README.md', 'documentation only')
        command('git', 'add', '.')
        command('git', 'commit', '-qm', 'docs')
        assert same_discovery_inputs?(original, 'HEAD')
        paths.each do |path|
          previous = command('git', 'rev-parse', 'HEAD').strip
          File.write(path, 'changed')
          command('git', 'add', '.')
          command('git', 'commit', '-qm', 'change input')
          refute same_discovery_inputs?(previous, 'HEAD'), path
          refute same_inputs?(previous, 'HEAD'), path if path.start_with?('.github/scripts/')
        end
      end
    end
  end

end
