#
# Cookbook:: cis-benchmarks
# Recipe:: _lazy_attributes_windows_server_2012r2_domain_controller_level_1
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# 2.2.2 (L1) Configure 'Access this computer from the network'
# Level 1 - Domain Controller. The recommended state for this setting is: Administrators, Authenticated Users, ENTERPRISE DOMAIN CONTROLLERS.
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeNetworkLogonRight'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeNetworkLogonRight'] = 'Administrators,Authenticated Users,ENTERPRISE DOMAIN CONTROLLERS'
end

# 2.2.4 (L1) Ensure 'Add workstations to domain' is set to 'Administrators'
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeMachineAccountPrivilege'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeMachineAccountPrivilege'] = 'Administrators'
end

# 2.2.6 (L1) Configure 'Allow log on locally'
# Level 1 - Domain Controller. The recommended state for this setting is: Administrators, ENTERPRISE DOMAIN CONTROLLERS.
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeInteractiveLogonRight'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeInteractiveLogonRight'] = 'Administrators,ENTERPRISE DOMAIN CONTROLLERS'
end

# 2.2.7 (L1) Configure 'Allow log on through Remote Desktop Services'
# Level 1 - Domain Controller. The recommended state for this setting is: Administrators.
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteInteractiveLogonRight'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteInteractiveLogonRight'] = 'Administrators'
end

# 2.2.17 (L1) Configure 'Deny access to this computer from the network'
# Level 1 - Domain Controller. The recommended state for this setting is to include: Guests, Local account
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyNetworkLogonRight'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyNetworkLogonRight'] = 'Guests,Local account'
end

# 2.2.22 (L1) Configure 'Enable computer and user accounts to be trusted for delegation'
# Level 1 - Domain Controller. The recommended state for this setting is: Administrators
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeEnableDelegationPrivilege'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeEnableDelegationPrivilege'] = 'Administrators'
end

# 2.2.39 (L1) Ensure 'Synchronize directory service data' is set to 'No One' (DC only)
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeSyncAgentPrivilege'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeSyncAgentPrivilege'] = ''
end

# 2.3.5.1 (L1) Ensure 'Domain controller: Allow server operators to schedule tasks' is set to 'Disabled' (DC Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.5.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.5.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    values: {
      name: 'SubmitControl',
      type: :dword,
      data: 0,
    },
  }
end

# 2.3.5.2 (L1) Ensure 'Domain controller: LDAP server signing requirements' is set to 'Require signing' (DC Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.5.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.5.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NTDS\Parameters',
    values: {
      name: 'LDAPServerIntegrity',
      type: :dword,
      data: 2,
    },
  }
end

# 2.3.5.3 (L1) Ensure 'Domain controller: Refuse machine account password changes' is set to 'Disabled' (DC Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.5.3'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.5.3'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
    values: {
      name: 'RefusePasswordChange',
      type: :dword,
      data: 0,
    },
  }
end

# 2.3.10.6 (L1) Configure 'Network access: Named Pipes that can be accessed anonymously'
# Level 1 - Domain Controller. The recommended state for this setting is: LSARPC, NETLOGON, SAMR and (when the legacy Computer Browser service is enabled) BROWSER.
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.6'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.6'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    values: {
      name: 'NullSessionPipes',
      type: :multi_string,
      data: %w(LSARPC NETLOGON SAMR),
    },
  }
end

# 17.2.3 (L1) Ensure 'Audit Distribution Group Management' is set to 'Success and Failure' (DC Only)
if node['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.2.3'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.2.3'] = {
    subcategory: 'Distribution Group Management',
    success: true,
    failure: true,
  }
end

# 17.4.1 (L1) Ensure 'Audit Directory Service Access' is set to 'Success and Failure' (DC Only)
if node['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.4.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.4.1'] = {
    subcategory: 'Directory Service Access',
    success: true,
    failure: true,
  }
end

# 17.4.2 (L1) Ensure 'Audit Directory Service Changes' is set to 'Success and Failure' (DC Only)
if node['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.4.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.4.2'] = {
    subcategory: 'Directory Service Changes',
    success: true,
    failure: true,
  }
end
