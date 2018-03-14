#
# Cookbook:: cis-benchmarks
# Recipe:: _lazy_attributes_windows_server_2012r2_member_server_level_2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

include_recipe 'cis-benchmarks::_lazy_attributes_windows_server_2012r2_common_level_2'

# 2.3.7.6 (L2) Ensure 'Interactive logon: Number of previous logons to cache (in case domain controller is not available)' is set to '4 or fewer logon(s)' (MS Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.6'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.6'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    values: {
      name: 'CachedLogonsCount',
      type: :string,
      data: '4',
    },
  }
end

# 18.4.21.2 (L2) Ensure 'Prohibit connection to non-domain networks when connected to domain authenticated network' is set to 'Enabled' (MS Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.21.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.21.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy',
    values: {
      name: 'fBlockNonDomain',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.32.2 (L2) Ensure 'Restrict Unauthenticated RPC clients' is set to 'Enabled: Authenticated' (MS Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.32.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.32.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc',
    values: {
      name: 'RestrictRemoteClients',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.44.1.2 (L2) Ensure 'Enable Windows NTP Server' is set to 'Disabled' (MS Only)
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.44.1.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.44.1.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32time\TimeProviders\NtpServer',
    values: {
      name: 'Enabled',
      type: :dword,
      data: 0,
    },
  }
end
