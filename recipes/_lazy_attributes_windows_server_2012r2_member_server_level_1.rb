#
# Cookbook:: cis-benchmarks
# Recipe:: _lazy_attributes_windows_server_2012r2_member_server_level_1
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# 2.2.2 (L1) Configure 'Access this computer from the network'
# Level 1 - Member Server. The recommended state for this setting is: Administrators, Authenticated Users.
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeNetworkLogonRight'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeNetworkLogonRight'] = 'Administrators,Authenticated Users'
end

# 2.2.6 (L1) Configure 'Allow log on locally'
# Level 1 - Member Server. The recommended state for this setting is: Administrators.
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeInteractiveLogonRight'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeInteractiveLogonRight'] = 'Administrators'
end

# 2.2.7 (L1) Configure 'Allow log on through Remote Desktop Services'
# Level 1 - Member Server. The recommended state for this setting is: Administrators, Remote Desktop Users.
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteInteractiveLogonRight'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteInteractiveLogonRight'] = 'Administrators,Remote Desktop Users'
end

# 2.2.17 (L1) Configure 'Deny access to this computer from the network'
# Level 1 - Member Server. The recommended state for this setting is to include: Guests, Local account and member of Administrators group
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyNetworkLogonRight'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyNetworkLogonRight'] = 'Guests,Local account and member of Administrators group'
end

# 2.2.22 (L1) Configure 'Enable computer and user accounts to be trusted for delegation'
# Level 1 - Member Server. The recommended state for this setting is: No One.
if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeEnableDelegationPrivilege'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeEnableDelegationPrivilege'] = ''
end

# 2.3.7.8 (L1) Ensure 'Interactive logon: Require Domain Controller Authentication to unlock workstation' is set to 'Enabled' (MS Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.8'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.8'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    values: {
      name: 'ForceUnlockLogon',
      type: :dword,
      data: 1,
    },
  }
end

# 2.3.9.5 (L1) Ensure 'Microsoft network server: Server SPN target name validation level' is set to 'Accept if provided by client' or higher (MS Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.9.5'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.9.5'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    values: {
      name: 'SmbServerNameHardeningLevel',
      type: :dword,
      data: 1,
    },
  }
end

# 2.3.10.2 (L1) Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts' is set to 'Enabled' (MS Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    values: {
      name: 'restrictanonymoussam',
      type: :dword,
      data: 1,
    },
  }
end

# 2.3.10.3 (L1) Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts and shares' is set to 'Enabled' (MS Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.3'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.3'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    values: {
      name: 'restrictanonymous',
      type: :dword,
      data: 1,
    },
  }
end

# 2.3.10.6 (L1) Configure 'Network access: Named Pipes that can be accessed anonymously'
# Level 1 - Member Server. The recommended state for this setting is: <blank> (i.e. None), or (when the legacy Computer Browser service is enabled) BROWSER.
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.6'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.6'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
    values: {
      name: 'NullSessionPipes',
      type: :multi_string,
      data: [],
    },
  }
end

# 18.6.1 (L1) Ensure 'Apply UAC restrictions to local accounts on network logons' is set to 'Enabled' (MS Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.6.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.6.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
    values: {
      name: 'LocalAccountTokenFilterPolicy',
      type: :dword,
      data: 0,
    },
  }
end

# 18.8.32.1 (L1) Ensure 'Enable RPC Endpoint Mapper Client Authentication' is set to 'Enabled' (MS Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.32.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.32.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc',
    values: {
      name: 'EnableAuthEpResolution',
      type: :dword,
      data: 1,
    },
  }
end
