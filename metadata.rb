name 'st2'
maintainer 'Brian Clark'
maintainer_email 'brian@clark.zone'
license 'mit'
description 'Installs/Configures StackStorm'
long_description 'Installs/Configures StackStorm'
version '0.1.0'

issues_url 'https://github.com/bdclark/chef-st2/issues' if respond_to?(:issues_url)
source_url 'https://github.com/bdclark/chef-st2' if respond_to?(:source_url)

depends 'packagecloud'
depends 'apt'
depends 'chef_nginx', '~> 6.0'
