require 'minitest/spec'
require 'mixlib/shellout'

class TestNodeJsInstall < MiniTest::Chef::Spec
  describe 'node version' do
    it 'installs the specified version' do
      if windows? then
        nodejs_cmd = Mixlib::ShellOut.new('C:\"Program Files (x86)"\nodejs\node.exe --version')
        nodejs_cmd.run_command
        result = nodejs_cmd.stdout.chomp
        assert_includes result, node['nodejs']['version']
      end
    end
  end
end
