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
default['nodejs']['windows']['checksum_x64'] =
  '82025035bfd55f87ad6e65f2434824c49c29e2d9b9f0ac15b1e01a8e4dc145b6'
default['nodejs']['windows']['checksum_x86'] =
  'f2414a5f82ddecee5f9ca9fe63ceb8047d740479af797c9db98679d30a8e51f8'
