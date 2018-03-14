name                'cis-benchmarks-test'
maintainer          'Steve Mastrorocco'
maintainer_email    'stephen.mastrorocco@gmail.com'
description         'cis-benchmarks-test Cookbook'
long_description    'cis-benchmarks-test Cookbook'
version             '0.1.0'
chef_version        '>= 13.0' if respond_to?(:chef_version)

# Platform support
supports 'windows'

# Cookbook Dependencies
depends 'windows', '~> 4.0.1'
depends 'cis-benchmarks'
