#
# Cookbook Name:: lxd
# Recipe:: install_from_package
#
# Copyright (C) 2015 Barthelemy Vessemont
#
# Licensed under the Apache License, Version 2.0 (the "License");

include_recipe 'apt'

apt_repository 'lxd-daily' do
  uri 'ppa:ubuntu-lxc/lxd-daily'
  distribution node['lsb']['codename']
end

package 'lxd'

['/etc/subuid', '/etc/subgid'].each do |subid|
  template subid do
    source 'subid.erb'
    notifies :restart, 'service[lxd]', :delayed
  end
end

service 'lxd' do
  supports :status => true, :start => true, :stop => true, :restart => true
  action [:enable, :start]
end
