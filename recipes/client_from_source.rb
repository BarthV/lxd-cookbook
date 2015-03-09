#
# Cookbook Name:: lxd
# Recipe:: client_from_source
#
# Copyright (C) 2015 Barthelemy Vessemont
#
# Licensed under the Apache License, Version 2.0 (the "License");

include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'golang'

group 'lxd' do
  system true
  append true
  members [node['lxd']['user']]
end

[node['lxd']['home'], File.join(node['lxd']['home'], 'lxc')].each do |d|
  directory d do
    owner node['lxd']['user']
    group node['lxd']['user']
  end
end

node['lxd']['src_packages'].each do |pkg|
  package pkg
end

golang_package node['lxd']['gosrc'] do
  action :update
  notifies :run, 'execute[build-lxd]', :immediate
end

execute 'build-lxd' do
  command 'go get -v -u -d ./... && make'
  environment(
    'PATH' => "#{node['go']['install_dir']}/go/bin:#{node['go']['gobin']}:#{ENV['PATH']}",
    'GOPATH' => node['go']['gopath'],
    'GOBIN' => node['go']['gobin']
  )
  cwd File.join(node['go']['gopath'], 'src', node['lxd']['gosrc'])
  action :nothing
end

link '/usr/local/sbin/lxc' do
  to File.join(node['go']['gobin'], 'lxc')
end
