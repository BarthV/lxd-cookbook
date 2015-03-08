# options : source, package
default['lxd']['install_method'] = 'package'
default['lxd']['user'] = 'root'
default['lxd']['home'] = '/var/lib/lxd'

default['lxd']['packages'] = %w(
  acl xzip tar rsync pxz xz-utils
  python-lzma cgroup-bin libpam-systemd
)

default['lxd']['subuser'] = node['lxd']['user']
default['lxd']['subid'] = '1000000'
default['lxd']['subcount'] = '65536'

# package install cfg
default['lxd']['repo'] = 'ppa:ubuntu-lxc/lxd-daily'

# source install cfg
default['lxd']['tcp_ip'] = '127.0.0.1'
default['lxd']['tcp_port'] = '8443'
default['lxd']['gosrc'] = 'github.com/lxc/lxd'
default['lxd']['src_packages'] = %w(
  lxc lxc-dev mercurial git pkg-config protobuf-compiler golang-goprotobuf-dev
)
# protobuf-compiler golang-goprotobuf-dev
default['lxd']['logdir'] = '/var/log/lxd'
default['lxd']['logdays'] = 31
