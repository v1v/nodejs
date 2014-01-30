maintainer       'Promet Solutions'
maintainer_email 'marius@promethost.com'
license          'Apache 2.0'
description      'Installs/Configures nodejs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
ver_path = File.join(File.dirname(__FILE__), 'version.txt')
version ((IO.read(ver_path) if File.exists?(ver_path)) || '1.3.0').chomp
name             'nodejs'
provides         'nodejs'

recipe 'nodejs', 'Installs Node.JS based on the default installation method'
recipe 'nodejs::windows', 'Installs Node.JS on Windows using the standard installer'
recipe 'nodejs::install_from_source', 'Installs Node.JS from source'
recipe 'nodejs::install_from_binary', 'Installs Node.JS from official binaries'
recipe 'nodejs::install_from_package', 'Installs Node.JS from packages; supports windows'
recipe 'nodejs::npm', 'Installs npm from source - a package manager for node'

%w{ apt yum build-essential windows }.each do |c|
  depends c
end

%w{ debian ubuntu centos redhat smartos windows }.each do |os|
  supports os
end
