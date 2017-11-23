#
# Cookbook:: cis-benchmarks
# Recipe:: _lazy_attributes_windows_server_2012r2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

profile_name  = node['cis-benchmarks']['windows_server_2012r2']['profile_name']
profile_level = node['cis-benchmarks']['windows_server_2012r2']['profile_level']

# TODO: Make this not disgusting
case profile_name
when 'member_server'
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

  if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.8'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.8'] = {
      name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
      values: {
        name: 'ForceUnlockLogon',
        type: :dword,
        data: 1,
      },
    }
  end

  if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.9.5'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.9.5'] = {
      name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
      values: {
        name: 'SmbServerNameHardeningLevel',
        type: :dword,
        data: 1,
      },
    }
  end

  if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.2'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.2'] = {
      name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      values: {
        name: 'restrictanonymoussam',
        type: :dword,
        data: 1,
      },
    }
  end

  if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.3'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.3'] = {
      name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      values: {
        name: 'restrictanonymous',
        type: :dword,
        data: 1,
      },
    }
  end

  if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.6'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.6'] = {
      name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
      values: {
        name: 'NullSessionPipes',
        type: :multi_string,
        data: [],
      },
    }
  end

  # Level 2
  if profile_level == 2
    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.6'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.6'] = {
        name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
        values: {
          name: 'CachedLogonsCount',
          type: :string,
          data: '4',
        },
      }
    end

    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.4'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.4'] = {
        name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
        values: {
          name: 'disabledomaincreds',
          type: :dword,
          data: 1,
        },
      }
    end
  end
when 'domain_controller'
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

  if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.5.1'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.5.1'] = {
      name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      values: {
        name: 'SubmitControl',
        type: :dword,
        data: 0,
      },
    }
  end

  if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.5.2'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.5.2'] = {
      name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NTDS\Parameters',
      values: {
        name: 'LDAPServerIntegrity',
        type: :dword,
        data: 2,
      },
    }
  end

  if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.5.3'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.5.3'] = {
      name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
      values: {
        name: 'RefusePasswordChange',
        type: :dword,
        data: 0,
      },
    }
  end

  if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.6'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.6'] = {
      name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
      values: {
        name: 'NullSessionPipes',
        type: :multi_string,
        data: %w(LSARPC NETLOGON SAMR),
      },
    }
  end

  # Level 2
  if profile_level == 2
    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBatchLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBatchLogonRight'] = 'Administrators'
    end
  end
end
