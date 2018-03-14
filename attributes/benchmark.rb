#
# Cookbook:: cis-benchmarks
# Attribute:: benchmark
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# CIS Benchmark to apply
default['cis-benchmarks']['benchmark'] = case node['platform']
                                         when 'windows'
                                           case node['platform_version']
                                           when /6.3.\d+/
                                             'windows_server_2012r2'
                                           end
                                         end
