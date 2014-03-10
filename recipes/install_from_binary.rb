Chef::Log.warn('nodejs::install_from_binary is deprecated, instead use nodejs::binary')
include_recipe 'nodejs::binary'
