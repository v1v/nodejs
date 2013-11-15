#
# Cookbook Name:: nodejs
# Attributes:: windows
#
# Copyright 2013, Daptiv Software Solutions, LLC
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

default['nodejs']['windows']['download_base_url'] = 'http://nodejs.org/dist'
default['nodejs']['windows']['package_name'] = 'Node.js'
default['nodejs']['windows']['checksum_x64'] = '7caabd3a774c96a8126f10d2e184727bd5160526'
default['nodejs']['windows']['checksum_x86'] = '76421e22cff4d4f4d1cb2ce3e3566e2c9004cdee'
