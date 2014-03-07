Chef::Log.warn('nodejs::install_from_package is deprecated, instead use nodejs::package')
include_recipe 'nodejs::package'
