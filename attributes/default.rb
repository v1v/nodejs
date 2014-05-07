#
# Cookbook Name:: nodejs
# Attributes:: nodejs
#
# Copyright 2010-2012, Promet Solutions
# Copyright 2013-2014, Daptiv Solutions LLC
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

default['nodejs']['src_url'] = 'http://nodejs.org/dist'
default['nodejs']['version'] = '0.10.26'
default['nodejs']['npm'] = '1.2.14'

default['nodejs']['checksum'] =
  'ef5e4ea6f2689ed7f781355012b942a2347e0299da0804a58de8e6281c4b1daa'
default['nodejs']['checksum_linux_x64'] =
  '305bf2983c65edea6dd2c9f3669b956251af03523d31cf0a0471504fd5920aac'
default['nodejs']['checksum_linux_x86'] =
  '8fa2d952556c8b5aa37c077e2735c972c522510facaa4df76d4244be88f4dc0f'

default['nodejs']['checksum_windows_x64'] =
  '82025035bfd55f87ad6e65f2434824c49c29e2d9b9f0ac15b1e01a8e4dc145b6'
default['nodejs']['msi_url_x64'] = node['nodejs']['src_url'] +
  "/v#{node['nodejs']['version']}/x64/node-v#{node['nodejs']['version']}-x64.msi"

default['nodejs']['checksum_windows_x86'] =
  'f2414a5f82ddecee5f9ca9fe63ceb8047d740479af797c9db98679d30a8e51f8'
default['nodejs']['msi_url_x86'] = node['nodejs']['src_url'] +
  "/v#{node['nodejs']['version']}/node-v#{node['nodejs']['version']}-x86.msi"

if platform?('windows')
  default['nodejs']['install_method'] = 'windows'
  default['nodejs']['dir'] = ::File.join('c:', 'Program Files', 'nodejs')
  default['nodejs']['bin_dir'] = node['nodejs']['dir']
  default['nodejs']['options'] = '/Lime nodejs.log'
  default['nodejs']['installer_timeout'] = 600
else
  default['nodejs']['install_method'] = 'source'
  default['nodejs']['dir'] = '/usr/local'

  if node['nodejs']['install_method'] == 'package'
    default['nodejs']['bin_dir'] = '/usr/bin'
  else
    default['nodejs']['bin_dir'] = ::File.join(node['nodejs']['dir'], 'bin')
  end
end

# Used when compiling from source on Linux
default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

# Set this to true to install the legacy packages (0.8.x) from ubuntu/debian repositories; default is false (using the latest stable 0.10.x)
default['nodejs']['legacy_packages'] = false

# The installer package name on Windows
default['nodejs']['package_name'] = 'Node.js'
