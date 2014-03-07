#
# Author:: Shawn Neal (<sneal@daptiv.com>)
# Cookbook Name:: nodejs-cookbook
# Library:: nodejsversion
#
# Copyright:: Copyright (c) 2013-2014 Daptiv Solutions LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'mixlib/shellout'

module NodejsCookbook
  module Helper

    def installed_version()
      version = '0.0.0'
      node_exe = ::File.join(node['nodejs']['bin_dir'], 'node')
      if File.exists?(node_exe)
        nodejs_cmd = Mixlib::ShellOut.new("#{node_exe} --version")
        nodejs_cmd.run_command
        version = nodejs_cmd.stdout.chomp
      end
      Chef::Log.info("Found NodeJS installed version: #{version}")
      version
    end

  end
end
