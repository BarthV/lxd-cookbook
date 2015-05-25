# [lxd-cookbook](https://github.com/BarthV/lxd-cookbook)
[![CK Version](http://img.shields.io/cookbook/v/lxd.svg)](https://supermarket.getchef.com/cookbooks/lxd) [![Travis](https://img.shields.io/travis/BarthV/lxd-cookbook.svg)](https://travis-ci.org/BarthV/lxd-cookbook)
[![Gitter chat](https://badges.gitter.im/BarthV/lxd.png)](https://gitter.im/BarthV/lxd-cookbook)

## DESCRIPTION

Installs and runs LXD API daemon, LXC and LXD CLI tool.

## Supported Platforms

* Ubuntu 14.04

Should work perfectly with upper Ubuntu releases.

May work with other OS when building from sources, PR are welcome !

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['lxd']['install_method']</tt></td>
    <td>Install method (source/package)</td>
    <td><tt>'package'</tt></td>
  </tr>
  <tr>
    <td><tt>['lxd']['repo']</tt></td>
    <td>ppa target (package install)</td>
    <td><tt>'ppa:ubuntu-lxc/lxd-daily'</tt></td>
  </tr>
  <tr>
    <td><tt>['lxd']['lxc-repo']</tt></td>
    <td>ppa target for lxc (both install)</td>
    <td><tt>'ppa:ubuntu-lxc/lxc-stable'</tt></td>
  </tr>
  <tr>
    <td><tt>['lxd']['tcp_ip']</tt></td>
    <td>API bind IP (source install)</td>
    <td><tt>'127.0.0.1'</tt></td>
  </tr>
  <tr>
    <td><tt>['lxd']['tcp_port']</tt></td>
    <td>API bind port (source install)</td>
    <td><tt>'8443'</tt></td>
  </tr>
  <tr>
    <td><tt>['lxd']['logdir']</tt></td>
    <td>log directory (source install)</td>
    <td><tt>'/var/log/lxd'</tt></td>
  </tr>
  <tr>
    <td><tt>['lxd']['logdays']</tt></td>
    <td>log retention in days (source install)</td>
    <td><tt>31</tt></td>
  </tr>
</table>

### Recipes

* **lxd::default**
    * Installs lxd following ```node['lxd']['install_method']``` method.

* **lxd::client**
    * Install lxd client tools following ```node['lxd']['install_method']``` method.

* **lxd::lxc**
    * Setup lxc repo using ```node['lxd']['lxc-repo']```.

### Install methods

#### Package

Install lxd from packages:

```chef
node['lxd']['install_method'] = 'package' # Not necessary because it's the default
include_recipe 'lxd'
# Or
include_recipe 'lxd::lxd_from_package'
```

#### Source

Install node from sources:

```chef
node['lxd']['install_method'] = 'source'
include_recipe 'lxd'
# Or
include_recipe 'lxd::lxd_from_source'
```

## License and Authors

Licensed under the Apache License, Version 2.0.

Authors :

* Barthelemy Vessemont (<bvessemont@gmail.com>)
