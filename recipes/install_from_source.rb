Chef::Log.warn('nodejs::install_from_source is deprecated, instead use nodejs::source')
include_recipe 'nodejs::source'
