#
# Cookbook:: cis-benchmarks
# Recipe:: _lazy_attributes_windows_server_2012r2_domain_controller_level_2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

include_recipe 'cis-benchmarks::_lazy_attributes_windows_server_2012r2_common_level_2'

# 2.2.29 (L2) Ensure 'Log on as a batch job' is set to 'Administrators' (DC Only)
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBatchLogonRight'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBatchLogonRight'] = 'Administrators'
end
