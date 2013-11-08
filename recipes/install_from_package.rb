#
# Author:: Nathan L Smith (nlloyds@gmail.com)
# Author:: Marius Ducea (marius@promethost.com)
# Author:: Mike Devine (mdevine@daptiv.com)
# Cookbook Name:: nodejs
# Recipe:: install_from_package
#
# Copyright 2012, Cramer Development, Inc.
# Copyright 2013, Opscale
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

case node['platform_family']
  when 'debian'
    if node['nodejs']['legacy_packages'] == true
      repo = 'http://ppa.launchpad.net/chris-lea/node.js-legacy/ubuntu'
      packages = %w{ nodejs npm }
    else
      repo = 'http://ppa.launchpad.net/chris-lea/node.js/ubuntu'
      packages = %w{ nodejs }
    end
    apt_repository 'node.js' do
      uri repo
      distribution node['lsb']['codename']
      components ['main']
      keyserver "keyserver.ubuntu.com"
      key "C7917B12"
      action :add
    end
  when 'smartos'
    packages = %w{ nodejs }
  when 'windows'
    os_architecture = node['kernel']['os_architecture'] == '64-bit' ? 'x64' : 'x86'
    nodejs_version = node['nodejs']['version']
    checksum = node['nodejs']['windows']["checksum_#{os_architecture}"]
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
    end    
    
    #end of windows installation. return so we don't try and re-enter linux installation
    return
  else
    Chef::Log.error "There are no nodejs packages for this platform; please use the source or binary method to install node"
    return
end

packages.each do |node_pkg|
  package node_pkg
end
