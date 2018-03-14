#
# Cookbook:: cis-benchmarks
# Attribute:: windows_laps
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

return unless node['platform'] == 'windows'

# ---------
# 18.2 LAPS
# ---------

# 18.2.1 (L1) Ensure LAPS AdmPwd GPO Extension / CSE is installed
# Profile Applicability:
# -- Level 1 - Member Server
default['cis-benchmarks']['windows']['laps']['cse'] = case node['kernel']['os_info']['os_architecture']
                                                      when '32-bit'
                                                        {
                                                          name: 'Local Administrator Password Solution',
                                                          source: 'https://download.microsoft.com/download/C/7/A/C7AAD914-A8A6-4904-88A1-29E657445D03/LAPS.x86.msi',
                                                          checksum: '9f0fa541b472c20508973f561b0d7850a7bf779c8459f9e33471083619fd6eda',
                                                        }
                                                      else
                                                        {
                                                          name: 'Local Administrator Password Solution',
                                                          source: 'https://download.microsoft.com/download/C/7/A/C7AAD914-A8A6-4904-88A1-29E657445D03/LAPS.x64.msi',
                                                          checksum: 'f63ebbc45e2d080630bd62a195cd225de734131a56bb7b453c84336e37abd766',
                                                        }
                                                      end

# 18.2.2 (L1) Ensure 'Do not allow password expiration time longer than required by policy' is set to 'Enabled'
# Profile Applicability:
# -- Level 1 - Member Server
default['cis-benchmarks']['windows']['laps']['cse']['registry_keys']['18.2.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd',
  values: {
    name: 'PwdExpirationProtectionEnabled',
    type: :dword,
    data: 1,
  },
}

# 18.2.3 (L1) Ensure 'Enable Local Admin Password Management' is set to 'Enabled'
# Profile Applicability:
# -- Level 1 - Member Server
default['cis-benchmarks']['windows']['laps']['cse']['registry_keys']['18.2.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd',
  values: {
    name: 'AdmPwdEnabled',
    type: :dword,
    data: 1,
  },
}

# 18.2.4 (L1) Ensure 'Password Settings: Password Complexity' is set to 'Enabled: Large letters + small letters + numbers + special characters'
# Profile Applicability:
# -- Level 1 - Member Server
default['cis-benchmarks']['windows']['laps']['cse']['registry_keys']['18.2.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd',
  values: {
    name: 'PasswordComplexity',
    type: :dword,
    data: 4,
  },
}

# 18.2.5 (L1) Ensure 'Password Settings: Password Length' is set to 'Enabled: 15 or more'
# Profile Applicability:
# -- Level 1 - Member Server
default['cis-benchmarks']['windows']['laps']['cse']['registry_keys']['18.2.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd',
  values: {
    name: 'PasswordLength',
    type: :dword,
    data: 15,
  },
}

# 18.2.6 (L1) Ensure 'Password Settings: Password Age (Days)' is set to 'Enabled: 30 or fewer'
# Profile Applicability:
# -- Level 1 - Member Server
default['cis-benchmarks']['windows']['laps']['cse']['registry_keys']['18.2.6'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd',
  values: {
    name: 'PasswordAgeDays',
    type: :dword,
    data: 30,
  },
}
