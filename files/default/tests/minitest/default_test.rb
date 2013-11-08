require 'minitest/spec'
require 'mixlib/shellout'


class TestNodeJsInstall < MiniTest::Chef::TestCase

  def test_node_version
    version = 'v' + node['nodejs']['version']
    nodejs = Mixlib::ShellOut.new('node --version')
    nodejs.run_command
    assert nodejs.stdout.strip == version
  end

end
