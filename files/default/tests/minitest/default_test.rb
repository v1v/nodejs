require 'minitest/spec'
require 'mixlib/shellout'

class TestNodeJsInstall < MiniTest::Chef::Spec
  describe 'node version' do
    it 'installs the specified version' do
      cmd = windows? ? 'C:\"Program Files (x86)"\nodejs\node.exe --version' : 'node --version'
      nodejs_cmd = Mixlib::ShellOut.new(cmd)
      nodejs_cmd.run_command
      result = nodejs_cmd.stdout.chomp

      # Ensure we got something
      refute_empty result

      # Package installation are at the mercy of the distro package mgr
      if node['nodejs']['install_method'] == 'source'
        assert_includes result, node['nodejs']['version']
      end

    end
  end
end
