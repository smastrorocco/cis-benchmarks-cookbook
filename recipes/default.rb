#
# Cookbook:: cis-benchmarks
# Recipe:: default
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

include_recipe "cis-benchmarks::#{node['cis-benchmarks']['benchmark']}"
