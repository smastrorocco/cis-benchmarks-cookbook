#
# Cookbook:: cis-benchmarks
# Recipe:: _lazy_attributes_windows_server_2012r2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

profile_name  = node['cis-benchmarks']['windows_server_2012r2']['profile_name']
profile_level = node['cis-benchmarks']['windows_server_2012r2']['profile_level']

case profile_name
when 'member_server'
  case profile_level
  when 1
    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeNetworkLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeNetworkLogonRight'] = 'Administrators,Authenticated Users'
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeInteractiveLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeInteractiveLogonRight'] = 'Administrators'
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteInteractiveLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteInteractiveLogonRight'] = 'Administrators,Remote Desktop Users'
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyNetworkLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyNetworkLogonRight'] = 'Guests,Local account and member of Administrators group'
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeEnableDelegationPrivilege'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeEnableDelegationPrivilege'] = ''
    end
  when 2
  end
when 'domain_controller'
  case profile_level
  when 1
    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeNetworkLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeNetworkLogonRight'] = 'Administrators,Authenticated Users,ENTERPRISE DOMAIN CONTROLLERS'
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeMachineAccountPrivilege'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeMachineAccountPrivilege'] = 'Administrators'
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeInteractiveLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeInteractiveLogonRight'] = 'Administrators,ENTERPRISE DOMAIN CONTROLLERS'
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteInteractiveLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteInteractiveLogonRight'] = 'Administrators'
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyNetworkLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyNetworkLogonRight'] = 'Guests,Local account'
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeEnableDelegationPrivilege'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeEnableDelegationPrivilege'] = 'Administrators'
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeSyncAgentPrivilege'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeSyncAgentPrivilege'] = ''
    end
  when 2
    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBatchLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBatchLogonRight'] = 'Administrators'
    end
  end
end
