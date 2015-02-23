# options : source, package
default['lxd']['install_method'] = 'package'
default['lxd']['user'] = 'root'

default['lxd']['subuser'] = node['lxd']['user']
default['lxd']['subid'] = '1000000'
default['lxd']['subcount'] = '65536'
