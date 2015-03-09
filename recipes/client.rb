#
# Cookbook Name:: lxd
# Recipe:: client
#

include_recipe "lxd::client_from_#{node['lxd']['install_method']}"
