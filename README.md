# [lxd-cookbook](https://github.com/BarthV/lxd-cookbook)
[![CK Version](http://img.shields.io/cookbook/v/lxd.svg)](https://supermarket.getchef.com/cookbooks/lxd) [![Build Status](https://img.shields.io/travis/BarthV/lxd.svg)](https://travis-ci.org/BarthV/lxd-cookbook)
[![Gitter chat](https://badges.gitter.im/BarthV/lxd.png)](https://gitter.im/BarthV/lxd)

## DESCRIPTION

Installs and runs LXD API daemon, LXC CLI tool.

## Supported Platforms

* Ubuntu 14.04

Should work perfectly with upper Ubuntu releases.

May work with other OS when building from sources.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['lxd']['install_method']</tt></td>
    <td>string</td>
    <td>Install method (source/package)</td>
    <td><tt>package</tt></td>
  </tr>
</table>

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
