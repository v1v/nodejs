#
# Author:: Shawn Neal (<sneal@daptiv.com>)
# Cookbook Name:: nodejs-cookbook
# Recipe:: windows
#
# Copyright:: Copyright (c) 2013 Daptiv Solutions LLC
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

::Chef::Recipe.send(:include, NodejsCookbook::Helper)

os_architecture = node['kernel']['os_architecture'] == '64-bit' ? 'x64' : 'x86'
nodejs_version = node['nodejs']['version']
checksum = node['nodejs']['windows']["checksum_#{os_architecture}"]
installed_version = installed_version()

url = node['nodejs']['windows']['download_base_url']
if (os_architecture == 'x64')
  url += "/v#{nodejs_version}/x64/node-v#{nodejs_version}-x64.msi"
else
  url += "/v#{nodejs_version}/node-v#{nodejs_version}-x86.msi"
end

windows_package node['nodejs']['windows']['package_name'] do
  source url
  checksum checksum
  installer_type :msi
  action :install
  version nodejs_version
  not_if { installed_version == "v#{node['nodejs']['version']}" }
end
