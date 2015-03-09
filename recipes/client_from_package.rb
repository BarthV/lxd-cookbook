#
# Cookbook Name:: lxd
# Recipe:: client_from_package
#
# Copyright (C) 2015 Barthelemy Vessemont
#
# Licensed under the Apache License, Version 2.0 (the "License");

include_recipe 'apt'

apt_repository 'lxd-daily' do
  uri node['lxd']['repo']
  distribution node['lsb']['codename']
end

package 'lxc'
