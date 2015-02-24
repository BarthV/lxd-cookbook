#
# Cookbook Name:: lxd
# Recipe:: install_from_source
#
# Copyright (C) 2015 Barthelemy Vessemont
#
# Licensed under the Apache License, Version 2.0 (the "License");

include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'golang'

group 'lxd' do
  system true
  append [node['lxd']['user']]
end

[node['lxd']['home'], File.join(node['lxd']['home'], 'lxc')].each do |d|
  directory d do
    owner node['lxd']['user']
    group node['lxd']['user']
  end
end

node['lxd']['packages'].each do |pkg|
  package pkg
end

golang_package node['lxd']['gosrc'] do
  action :install
  notifies :run, 'execute[build-lxd]', :immediate
end

execute 'build-lxd' do
  command 'go get -v -d ./... && make'
  environment(
    'PATH' => "#{node['go']['install_dir']}/go/bin:#{ENV['PATH']}",
    'GOPATH' => node['go']['gopath'],
    'GOBIN' => node['go']['gobin']
  )
  cwd File.join(node['go']['gopath'], 'src', node['lxd']['gosrc'])
  action :nothing
end

directory node['lxd']['logdir'] do
  owner node['lxd']['user']
  group node['lxd']['user']
end

['/etc/subuid', '/etc/subgid'].each do |subid|
  template subid do
    source 'subid.erb'
    notifies :restart, 'service[lxd]', :delayed
  end
end

template '/etc/init/lxd.conf' do
  source 'lxd.upstart.erb'
  notifies :restart, 'service[lxd]', :delayed
end

service 'lxd' do
  supports :status => true, :start => true, :stop => true, :restart => true
  action [:enable, :start]
end

logrotate_app 'lxd' do
  path File.join(node['lxd']['logdir'], 'lxd.log')
  frequency 'daily'
  create "644 #{node['lxd']['user']} #{node['lxd']['user']}"
  rotate node['lxd']['logdays']
end
