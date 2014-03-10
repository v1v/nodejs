require 'minitest/spec'
require 'mixlib/shellout'

class TestNodeJsInstall < MiniTest::Chef::Spec
  describe 'node version' do
    it 'installs the specified version' do
      # stupid 32bit Ruby version has wrong Program Files dir
      cmd = "\"#{::File.join(node['nodejs']['bin_dir'], 'node')}\" --version"
      Chef::Log.info(cmd)
      puts cmd
      nodejs_cmd = Mixlib::ShellOut.new(cmd)
      nodejs_cmd.run_command
      result = nodejs_cmd.stdout.chomp

      # Ensure we got something for all install sources
      refute_empty result

      # Package installation are at the mercy of the distro package mgr
      if node['nodejs']['install_method'] != 'package'
        assert_includes result, node['nodejs']['version']
      end

    end
  end
end
