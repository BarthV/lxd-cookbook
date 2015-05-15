#
# Cookbook Name:: lxd
# Recipe:: lxc
#

apt_repository 'lxc' do
  uri node['lxd']['lxc-repo']
  distribution node['lsb']['codename']
  not_if { node['lxd']['lxc-repo'].nil? }
end

include_recipe 'apt' unless node['lxd']['lxc-repo'].nil?
