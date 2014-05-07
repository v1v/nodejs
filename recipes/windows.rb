#
# Author:: Shawn Neal (<sneal@daptiv.com>)
# Cookbook Name:: nodejs
# Recipe:: windows
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

require ::File.join(::File.dirname(__FILE__), '..', 'libraries', 'helper')
helper = NodejsCookbook::Helper.new(node)

installed_version = helper.installed_version()
arch = node['kernel']['machine'] =~ /x86_64/ ? 'x64' : 'x86'

windows_package node['nodejs']['package_name'] do
  source node['nodejs']["msi_url_#{arch}"]
  checksum node['nodejs']["checksum_windows_#{arch}"]
  installer_type :msi
  action :install
  version node['nodejs']['version']
  options node['nodejs']['options']
  timeout node['nodejs']['installer_timeout']
  not_if { installed_version == "v#{node['nodejs']['version']}" }
end
