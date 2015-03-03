name 'lxd'
maintainer 'Barthelemy Vessemont'
maintainer_email 'bvessemont@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures lxd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0'
supports 'ubuntu', '>= 14.04'

depends 'apt'
depends 'build-essential'
depends 'golang'
depends 'logrotate'
