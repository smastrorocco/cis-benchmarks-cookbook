#
# Cookbook:: cis-benchmarks
# Attribute:: windows_server_2012r2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

return unless node['platform'] == 'windows' && /6.3.\d+/.match(node['platform_version'])

# CIS Microsoft Windows Server 2012 R2 Benchmark v2.2.1
# Valid profile names: member_server | domain_controller
# Valid profile levels: 1 | 2
default['cis-benchmarks']['windows_server_2012r2']['profile_name'] = 'member_server'
default['cis-benchmarks']['windows_server_2012r2']['profile_level'] = 1

# NOTE: Many attributes below need to be derived based on the profile attibutes
#       above.  If an attribute is set to nil, that is because it will be
#       derived during the chef-client run.  If the attribute is defined in a
#       wrapper cookbook, environment, or role, that value will be used instead.
#       Use an empty string to define the attribute as 'none', in which case the
#       attribute will not be derived.  Any attribute that is derived will be
#       set at default precedence.

##########################################################################
#                        SECURITY POLICY SETTINGS                        #
##########################################################################
# Security policy settings template
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['cookbook'] = 'cis-benchmarks'
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['source'] = 'security_policy.inf.erb'

### 1 Account Policies
## 1.1 Password Policy
# 1.1.1 (L1) Ensure 'Enforce password history' is set to '24 or more password(s)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['PasswordHistorySize'] = 24

# 1.1.2 (L1) Ensure 'Maximum password age' is set to '60 or fewer days, but not 0'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['MaximumPasswordAge'] = 60

# 1.1.3 (L1) Ensure 'Minimum password age' is set to '1 or more day(s)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['MinimumPasswordAge'] = 1

# 1.1.4 (L1) Ensure 'Minimum password length' is set to '14 or more character(s)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['MinimumPasswordLength'] = 14

# 1.1.5 (L1) Ensure 'Password must meet complexity requirements' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['PasswordComplexity'] = 1

# 1.1.6 (L1) Ensure 'Store passwords using reversible encryption' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['ClearTextPassword'] = 0

## 1.2 Account Lockout Policy
# 1.2.1 (L1) Ensure 'Account lockout duration' is set to '15 or more minute(s)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['LockoutDuration'] = 15

# 1.2.2 (L1) Ensure 'Account lockout threshold' is set to '10 or fewer invalid logon attempt(s), but not 0'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['LockoutBadCount'] = 10

# 1.2.3 (L1) Ensure 'Reset account lockout counter after' is set to '15 or more minute(s)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['ResetLockoutCount'] = 15

### 2 Local Policies
## 2.2 User Rights Assignment
# 2.2.1 (L1) Ensure 'Access Credential Manager as a trusted caller' is set to 'No One'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeTrustedCredManAccessPrivilege'] = ''

# 2.2.2 (L1) Configure 'Access this computer from the network'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeNetworkLogonRight'] = nil

# 2.2.3 (L1) Ensure 'Act as part of the operating system' is set to 'No One'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeTcbPrivilege'] = ''

# 2.2.4 (L1) Ensure 'Add workstations to domain' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeMachineAccountPrivilege'] = nil

# 2.2.5 (L1) Ensure 'Adjust memory quotas for a process' is set to 'Administrators, LOCAL SERVICE, NETWORK SERVICE'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeIncreaseQuotaPrivilege'] = 'Administrators,LOCAL SERVICE,NETWORK SERVICE'

# 2.2.6 (L1) Configure 'Allow log on locally'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeInteractiveLogonRight'] = nil

# 2.2.7 (L1) Configure 'Allow log on through Remote Desktop Services'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteInteractiveLogonRight'] = nil

# 2.2.8 (L1) Ensure 'Back up files and directories' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBackupPrivilege'] = 'Administrators'

# 2.2.9 (L1) Ensure 'Change the system time' is set to 'Administrators, LOCAL SERVICE'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeSystemtimePrivilege'] = 'Administrators,LOCAL SERVICE'

# 2.2.10 (L1) Ensure 'Change the time zone' is set to 'Administrators, LOCAL SERVICE'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeTimeZonePrivilege'] = 'Administrators,LOCAL SERVICE'

# 2.2.11 (L1) Ensure 'Create a pagefile' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeCreatePagefilePrivilege'] = 'Administrators'

# 2.2.12 (L1) Ensure 'Create a token object' is set to 'No One'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeCreateTokenPrivilege'] = ''

# 2.2.13 (L1) Ensure 'Create global objects' is set to 'Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeCreateGlobalPrivilege'] = 'Administrators,LOCAL SERVICE,NETWORK SERVICE,SERVICE'

# 2.2.14 (L1) Ensure 'Create permanent shared objects' is set to 'No One'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeCreatePermanentPrivilege'] = ''

# 2.2.15 (L1) Configure 'Create symbolic links'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeCreateSymbolicLinkPrivilege'] = 'Administrators'

# 2.2.16 (L1) Ensure 'Debug programs' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDebugPrivilege'] = 'Administrators'

# 2.2.17 (L1) Configure 'Deny access to this computer from the network'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyNetworkLogonRight'] = nil

# 2.2.18 (L1) Ensure 'Deny log on as a batch job' to include 'Guests'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyBatchLogonRight'] = 'Guests'

# 2.2.19 (L1) Ensure 'Deny log on as a service' to include 'Guests'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyServiceLogonRight'] = 'Guests'

# 2.2.20 (L1) Ensure 'Deny log on locally' to include 'Guests'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyInteractiveLogonRight'] = 'Guests'

# 2.2.21 (L1) Ensure 'Deny log on through Remote Desktop Services' to include 'Guests, Local account'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyRemoteInteractiveLogonRight'] = 'Guests,Local account'

# 2.2.22 (L1) Configure 'Enable computer and user accounts to be trusted for delegation'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeEnableDelegationPrivilege'] = nil

# 2.2.23 (L1) Ensure 'Force shutdown from a remote system' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteShutdownPrivilege'] = 'Administrators'

# 2.2.24 (L1) Ensure 'Generate security audits' is set to 'LOCAL SERVICE, NETWORK SERVICE'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeAuditPrivilege'] = 'LOCAL SERVICE,NETWORK SERVICE'

# 2.2.25 (L1) Configure 'Impersonate a client after authentication'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeImpersonatePrivilege'] = 'Administrators,LOCAL SERVICE,NETWORK SERVICE,SERVICE'

# 2.2.26 (L1) Ensure 'Increase scheduling priority' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeIncreaseBasePriorityPrivilege'] = 'Administrators'

# 2.2.27 (L1) Ensure 'Load and unload device drivers' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeIncreaseBasePriorityPrivilege'] = 'Administrators'

# 2.2.28 (L1) Ensure 'Lock pages in memory' is set to 'No One'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeLockMemoryPrivilege'] = ''

# 2.2.29 (L2) Ensure 'Log on as a batch job' is set to 'Administrators'
# Profile Applicability:
#  Level 2 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBatchLogonRight'] = nil

# 2.2.30 (L1) Configure 'Manage auditing and security log'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeSecurityPrivilege'] = 'Administrators'

# 2.2.31 (L1) Ensure 'Modify an object label' is set to 'No One'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRelabelPrivilege'] = ''

# 2.2.32 (L1) Ensure 'Modify firmware environment values' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeSystemEnvironmentPrivilege'] = 'Administrators'

# 2.2.33 (L1) Ensure 'Perform volume maintenance tasks' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeManageVolumePrivilege'] = 'Administrators'

# 2.2.34 (L1) Ensure 'Profile single process' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeProfileSingleProcessPrivilege'] = 'Administrators'

# 2.2.35 (L1) Ensure 'Profile system performance' is set to 'Administrators, NT SERVICE\WdiServiceHost'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeSystemProfilePrivilege'] = 'Administrators,NT SERVICE\WdiServiceHost'

# 2.2.36 (L1) Ensure 'Replace a process level token' is set to 'LOCAL SERVICE, NETWORK SERVICE'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeAssignPrimaryTokenPrivilege'] = 'LOCAL SERVICE,NETWORK SERVICE'

# 2.2.37 (L1) Ensure 'Restore files and directories' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRestorePrivilege'] = 'Administrators'

# 2.2.38 (L1) Ensure 'Shut down the system' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeShutdownPrivilege'] = 'Administrators'

# 2.2.39 (L1) Ensure 'Synchronize directory service data' is set to 'No One'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeSyncAgentPrivilege'] = nil

# 2.2.40 (L1) Ensure 'Take ownership of files or other objects' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeTakeOwnershipPrivilege'] = 'Administrators'

## 2.3 Security Options
## 2.3.1 Accounts
# 2.3.1.1 (L1) Ensure 'Accounts: Administrator account status' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['EnableAdminAccount'] = 0

# 2.3.1.2 (L1) Ensure 'Accounts: Block Microsoft accounts' is set to 'Users can't add or log on with Microsoft accounts'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.1.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'NoConnectedUser',
    type: :dword,
    data: 3,
  },
}

# 2.3.1.3 (L1) Ensure 'Accounts: Guest account status' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['EnableGuestAccount'] = 0

# 2.3.1.4 (L1) Ensure 'Accounts: Limit local account use of blank passwords to console logon only' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.1.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
  values: {
    name: 'LimitBlankPasswordUse',
    type: :dword,
    data: 1,
  },
}

# 2.3.1.5 (L1) Configure 'Accounts: Rename administrator account'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['NewAdministratorName'] = 'Calvin'
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['NewAdministratorDescription'] = 'Spaceman Spiff'

# 2.3.1.6 (L1) Configure 'Accounts: Rename guest account'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['NewGuestName'] = 'Hobbes'
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['NewGuestDescription'] = 'Bengal tiger'

## 2.3.2 Audit
# 2.3.2.1 (L1) Ensure 'Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.2.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
  values: {
    name: 'SCENoApplyLegacyAuditPolicy',
    type: :dword,
    data: 1,
  },
}

# 2.3.2.2 (L1) Ensure 'Audit: Shut down system immediately if unable to log security audits' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.2.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
  values: {
    name: 'crashonauditfail',
    type: :dword,
    data: 0,
  },
}

## 2.3.4 Devices
# 2.3.4.1 (L1) Ensure 'Devices: Allowed to format and eject removable media' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.4.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
  values: {
    name: 'AllocateDASD',
    type: :string,
    data: '0',
  },
}

# 2.3.4.2 (L1) Ensure 'Devices: Prevent users from installing printer drivers' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.4.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers',
  values: {
    name: 'AddPrinterDrivers',
    type: :dword,
    data: 1,
  },
}

## 2.3.5 Domain controller
# 2.3.5.1 (L1) Ensure 'Domain controller: Allow server operators to schedule tasks' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.5.1'] = nil

# 2.3.5.2 (L1) Ensure 'Domain controller: LDAP server signing requirements' is set to 'Require signing'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.5.2'] = nil

# 2.3.5.3 (L1) Ensure 'Domain controller: Refuse machine account password changes' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.5.3'] = nil

## 2.3.6 Domain member
# 2.3.6.1 (L1) Ensure 'Domain member: Digitally encrypt or sign secure channel data (always)' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.6.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
  values: {
    name: 'RequireSignOrSeal',
    type: :dword,
    data: 1,
  },
}

# 2.3.6.2 (L1) Ensure 'Domain member: Digitally encrypt secure channel data (when possible)' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.6.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
  values: {
    name: 'SealSecureChannel',
    type: :dword,
    data: 1,
  },
}

# 2.3.6.3 (L1) Ensure 'Domain member: Digitally sign secure channel data (when possible)' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.6.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
  values: {
    name: 'SignSecureChannel',
    type: :dword,
    data: 1,
  },
}

# 2.3.6.4 (L1) Ensure 'Domain member: Disable machine account password changes' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.6.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
  values: {
    name: 'DisablePasswordChange',
    type: :dword,
    data: 0,
  },
}

# 2.3.6.5 (L1) Ensure 'Domain member: Maximum machine account password age' is set to '30 or fewer days, but not 0'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.6.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
  values: {
    name: 'MaximumPasswordAge',
    type: :dword,
    data: 30,
  },
}

# 2.3.6.6 (L1) Ensure 'Domain member: Require strong (Windows 2000 or later) session key' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.6.6'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
  values: {
    name: 'RequireStrongKey',
    type: :dword,
    data: 1,
  },
}

## 2.3.7 Interactive logon
# 2.3.7.1 (L1) Ensure 'Interactive logon: Do not display last user name' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'dontdisplaylastusername',
    type: :dword,
    data: 1,
  },
}

# 2.3.7.2 (L1) Ensure 'Interactive logon: Do not require CTRL+ALT+DEL' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'disablecad',
    type: :dword,
    data: 0,
  },
}

# 2.3.7.3 (L1) Ensure 'Interactive logon: Machine inactivity limit' is set to '900 or fewer second(s), but not 0'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'InactivityTimeoutSecs',
    type: :dword,
    data: 900,
  },
}

# 2.3.7.4 (L1) Configure 'Interactive logon: Message text for users attempting to log on'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'legalnoticetext',
    type: :string,
    data: 'This system is for the use of authorized users only. Individuals using this computer system ' \
          'without authority, or in excess of their authority, are subject to having all of their ' \
          'activities on this system monitored and recorded by system personnel.  In the course of ' \
          'monitoring individuals improperly using this system, or in the course of system maintenance, ' \
          'the activities of authorized users may also be monitored. Anyone using this system expressly ' \
          'consents to such monitoring and is advised that if such monitoring reveals possible evidence ' \
          'of criminal activity, system personnel may provide the evidence of such monitoring to law ' \
          'enforcement officials.',
  },
}

# 2.3.7.5 (L1) Configure 'Interactive logon: Message title for users attempting to log on'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'legalnoticecaption',
    type: :string,
    data: 'Notice to All Users (Authorized or Unauthorized)',
  },
}

# 2.3.7.6 (L2) Ensure 'Interactive logon: Number of previous logons to cache (in case domain controller is not available)' is set to '4 or fewer logon(s)'
# Profile Applicability:
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.6'] = nil

# 2.3.7.7 (L1) Ensure 'Interactive logon: Prompt user to change password before expiration' is set to 'between 5 and 14 days'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.7'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
  values: {
    name: 'PasswordExpiryWarning',
    type: :dword,
    data: 5,
  },
}

# 2.3.7.8 (L1) Ensure 'Interactive logon: Require Domain Controller Authentication to unlock workstation' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.8'] = nil

# 2.3.7.9 (L1) Ensure 'Interactive logon: Smart card removal behavior' is set to 'Lock Workstation' or higher
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.7.9'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
  values: {
    name: 'scremoveoption',
    type: :string,
    data: '1',
  },
}

## 2.3.8 Microsoft network client
# 2.3.8.1 (L1) Ensure 'Microsoft network client: Digitally sign communications (always)' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.8.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
  values: {
    name: 'RequireSecuritySignature',
    type: :dword,
    data: 1,
  },
}

# 2.3.8.2 (L1) Ensure 'Microsoft network client: Digitally sign communications (if server agrees)' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.8.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
  values: {
    name: 'EnableSecuritySignature',
    type: :dword,
    data: 1,
  },
}

# 2.3.8.3 (L1) Ensure 'Microsoft network client: Send unencrypted password to third-party SMB servers' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.8.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
  values: {
    name: 'EnablePlainTextPassword',
    type: :dword,
    data: 0,
  },
}

## 2.3.9 Microsoft network server
# 2.3.9.1 (L1) Ensure 'Microsoft network server: Amount of idle time required before suspending session' is set to '15 or fewer minute(s), but not 0'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.9.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
  values: {
    name: 'autodisconnect',
    type: :dword,
    data: 15,
  },
}

# 2.3.9.2 (L1) Ensure 'Microsoft network server: Digitally sign communications (always)' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.9.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
  values: {
    name: 'requiresecuritysignature',
    type: :dword,
    data: 1,
  },
}

# 2.3.9.3 (L1) Ensure 'Microsoft network server: Digitally sign communications (if client agrees)' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.9.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
  values: {
    name: 'enablesecuritysignature',
    type: :dword,
    data: 1,
  },
}

# 2.3.9.4 (L1) Ensure 'Microsoft network server: Disconnect clients when logon hours expire' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.9.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
  values: {
    name: 'enableforcedlogoff',
    type: :dword,
    data: 1,
  },
}

# 2.3.9.5 (L1) Ensure 'Microsoft network server: Server SPN target name validation level' is set to 'Accept if provided by client' or higher
# Profile Applicability:
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.9.5'] = nil

## 2.3.10 Network access
# 2.3.10.1 (L1) Ensure 'Network access: Allow anonymous SID/Name translation' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['LSAAnonymousNameLookup'] = 0

# 2.3.10.2 (L1) Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.2'] = nil

# 2.3.10.3 (L1) Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts and shares' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.3'] = nil

# 2.3.10.4 (L2) Ensure 'Network access: Do not allow storage of passwords and credentials for network authentication' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.4'] = nil

# 2.3.10.5 (L1) Ensure 'Network access: Let Everyone permissions apply to anonymous users' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
  values: {
    name: 'everyoneincludesanonymous',
    type: :dword,
    data: 0,
  },
}

# 2.3.10.6 (L1) Configure 'Network access: Named Pipes that can be accessed anonymously'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.6'] = nil

# 2.3.10.7 (L1) Configure 'Network access: Remotely accessible registry paths'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.7'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedExactPaths',
  values: {
    name: 'Machine',
    type: :multi_string,
    data: [
      'System\CurrentControlSet\Control\ProductOptions',
      'System\CurrentControlSet\Control\Server Applications',
      'Software\Microsoft\Windows NT\CurrentVersion',
    ],
  },
}

# 2.3.10.8 (L1) Configure 'Network access: Remotely accessible registry paths and sub-paths'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.8'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedPaths',
  values: {
    name: 'Machine',
    type: :multi_string,
    data: [
      'Software\Microsoft\OLAP Server',
      'Software\Microsoft\Windows NT\CurrentVersion\Perflib',
      'Software\Microsoft\Windows NT\CurrentVersion\Print',
      'Software\Microsoft\Windows NT\CurrentVersion\Windows',
      'System\CurrentControlSet\Control\ContentIndex',
      'System\CurrentControlSet\Control\Print\Printers',
      'System\CurrentControlSet\Control\Terminal Server',
      'System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration',
      'System\CurrentControlSet\Control\Terminal Server\UserConfig',
      'System\CurrentControlSet\Services\Eventlog',
      'System\CurrentControlSet\Services\SysmonLog',
    ],
  },
}

# 2.3.10.9 (L1) Ensure 'Network access: Restrict anonymous access to Named Pipes and Shares' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.9'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
  values: {
    name: 'restrictnullsessaccess',
    type: :dword,
    data: 1,
  },
}

# 2.3.10.10 (L1) Ensure 'Network access: Shares that can be accessed anonymously' is set to 'None'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.10'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
  values: {
    name: 'NullSessionShares',
    type: :multi_string,
    data: [],
  },
}

# 2.3.10.11 (L1) Ensure 'Network access: Sharing and security model for local accounts' is set to 'Classic - local users authenticate as themselves'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.11'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
  values: {
    name: 'forceguest',
    type: :dword,
    data: 0,
  },
}

## 2.3.11 Network security
# 2.3.11.1 (L1) Ensure 'Network security: Allow Local System to use computer identity for NTLM' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.11.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
  values: {
    name: 'UseMachineId',
    type: :dword,
    data: 1,
  },
}

# 2.3.11.2 (L1) Ensure 'Network security: Allow LocalSystem NULL session fallback' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.11.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
  values: {
    name: 'allownullsessionfallback',
    type: :dword,
    data: 0,
  },
}

# 2.3.11.3 (L1) Ensure 'Network Security: Allow PKU2U authentication requests to this computer to use online identities' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.11.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\pku2u',
  values: {
    name: 'AllowOnlineID',
    type: :dword,
    data: 0,
  },
}

# 2.3.11.4 (L1) Ensure 'Network Security: Configure encryption types allowed for Kerberos' is set to 'RC4_HMAC_MD5, AES128_HMAC_SHA1, AES256_HMAC_SHA1, Future encryption types'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.11.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system\Kerberos\Parameters',
  values: {
    name: 'SupportedEncryptionTypes',
    type: :dword,
    data: 2147483644,
  },
}

# 2.3.11.5 (L1) Ensure 'Network security: Do not store LAN Manager hash value on next password change' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.11.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
  values: {
    name: 'NoLmHash',
    type: :dword,
    data: 1,
  },
}

# 2.3.11.6 (L1) Ensure 'Network security: Force logoff when logon hours expire' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.11.6'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters',
  values: {
    name: 'enableforcedlogoff',
    type: :dword,
    data: 1,
  },
}

# 2.3.11.7 (L1) Ensure 'Network security: LAN Manager authentication level' is set to 'Send NTLMv2 response only. Refuse LM & NTLM'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.11.7'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
  values: {
    name: 'LmCompatibilityLevel',
    type: :dword,
    data: 5,
  },
}

# 2.3.11.8 (L1) Ensure 'Network security: LDAP client signing requirements' is set to 'Negotiate signing' or higher
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.11.8'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ldap',
  values: {
    name: 'ldapclientintegrity',
    type: :dword,
    data: 1,
  },
}

# 2.3.11.9 (L1) Ensure 'Network security: Minimum session security for NTLM SSP based (including secure RPC) clients' is set to 'Require NTLMv2 session security, Require 128-bit encryption'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.11.9'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
  values: {
    name: 'NtlmMinClientSec',
    type: :dword,
    data: 537395200,
  },
}

# 2.3.11.10 (L1) Ensure 'Network security: Minimum session security for NTLM SSP based (including secure RPC) servers' is set to 'Require NTLMv2 session security, Require 128-bit encryption'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.11.10'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
  values: {
    name: 'NtlmMinServerSec',
    type: :dword,
    data: 537395200,
  },
}

## 2.3.13 Shutdown
# 2.3.13.1 (L1) Ensure 'Shutdown: Allow system to be shut down without having to log on' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.13.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'shutdownwithoutlogon',
    type: :dword,
    data: 0,
  },
}

## 2.3.15 System objects
# 2.3.15.1 (L1) Ensure 'System objects: Require case insensitivity for nonWindows subsystems' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.15.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel',
  values: {
    name: 'obcaseinsensitive',
    type: :dword,
    data: 1,
  },
}

# 2.3.15.2 (L1) Ensure 'System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.15.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager',
  values: {
    name: 'ProtectionMode',
    type: :dword,
    data: 1,
  },
}

## 2.3.17 User Account Control
# 2.3.17.1 (L1) Ensure 'User Account Control: Admin Approval Mode for the Built-in Administrator account' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.17.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'FilterAdministratorToken',
    type: :dword,
    data: 1,
  },
}

# 2.3.17.2 (L1) Ensure 'User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.17.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'EnableUIADesktopToggle',
    type: :dword,
    data: 0,
  },
}

# 2.3.17.3 (L1) Ensure 'User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode' is set to 'Prompt for consent on the secure desktop'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.17.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'ConsentPromptBehaviorAdmin',
    type: :dword,
    data: 2,
  },
}

# 2.3.17.4 (L1) Ensure 'User Account Control: Behavior of the elevation prompt for standard users' is set to 'Automatically deny elevation requests'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.17.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'ConsentPromptBehaviorUser',
    type: :dword,
    data: 0,
  },
}

# 2.3.17.5 (L1) Ensure 'User Account Control: Detect application installations and prompt for elevation' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.17.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'EnableInstallerDetection',
    type: :dword,
    data: 1,
  },
}

# 2.3.17.6 (L1) Ensure 'User Account Control: Only elevate UIAccess applications that are installed in secure locations' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.17.6'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'EnableSecureUIAPaths',
    type: :dword,
    data: 1,
  },
}

# 2.3.17.7 (L1) Ensure 'User Account Control: Run all administrators in Admin Approval Mode' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.17.7'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'EnableLUA',
    type: :dword,
    data: 1,
  },
}

# 2.3.17.8 (L1) Ensure 'User Account Control: Switch to the secure desktop when prompting for elevation' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.17.8'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'PromptOnSecureDesktop',
    type: :dword,
    data: 1,
  },
}

# 2.3.17.9 (L1) Ensure 'User Account Control: Virtualize file and registry write failures to per-user locations' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.17.9'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'EnableVirtualization',
    type: :dword,
    data: 1,
  },
}

### 9 Windows Firewall With Advanced Security
## 9.1 Domain Profile
# 9.1.1 (L1) Ensure 'Windows Firewall: Domain: Firewall state' is set to 'On (recommended)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.1.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile',
  values: {
    name: 'EnableFirewall',
    type: :dword,
    data: 1,
  },
}

# 9.1.2 (L1) Ensure 'Windows Firewall: Domain: Inbound connections' is set to 'Block (default)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.1.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile',
  values: {
    name: 'DefaultInboundAction',
    type: :dword,
    data: 1,
  },
}

# 9.1.3 (L1) Ensure 'Windows Firewall: Domain: Outbound connections' is set to 'Allow (default)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.1.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile',
  values: {
    name: 'DefaultOutboundAction',
    type: :dword,
    data: 0,
  },
}

# 9.1.4 (L1) Ensure 'Windows Firewall: Domain: Settings: Display a notification' is set to 'No'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.1.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile',
  values: {
    name: 'DisableNotifications',
    type: :dword,
    data: 1,
  },
}

# 9.1.5 (L1) Ensure 'Windows Firewall: Domain: Settings: Apply local firewall rules' is set to 'Yes (default)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.1.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile',
  values: {
    name: 'AllowLocalPolicyMerge',
    type: :dword,
    data: 1,
  },
}

# 9.1.6 (L1) Ensure 'Windows Firewall: Domain: Settings: Apply local connection security rules' is set to 'Yes (default)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.1.6'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile',
  values: {
    name: 'AllowLocalIPsecPolicyMerge',
    type: :dword,
    data: 1,
  },
}

# 9.1.7 (L1) Ensure 'Windows Firewall: Domain: Logging: Name' is set to '%SYSTEMROOT%\System32\logfiles\firewall\domainfw.log'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.1.7'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging',
  values: {
    name: 'LogFilePath',
    type: :string,
    data: '%SYSTEMROOT%\System32\LogFiles\Firewall\domainfw.log',
  },
}

# 9.1.8 (L1) Ensure 'Windows Firewall: Domain: Logging: Size limit (KB)' is set to '16,384 KB or greater'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.1.8'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging',
  values: {
    name: 'LogFileSize',
    type: :dword,
    data: 16384,
  },
}

# 9.1.9 (L1) Ensure 'Windows Firewall: Domain: Logging: Log dropped packets' is set to 'Yes'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.1.9'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging',
  values: {
    name: 'LogDroppedPackets',
    type: :dword,
    data: 1,
  },
}

# 9.1.10 (L1) Ensure 'Windows Firewall: Domain: Logging: Log successful connections' is set to 'Yes'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.1.10'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging',
  values: {
    name: 'LogSuccessfulConnections',
    type: :dword,
    data: 1,
  },
}

## 9.2 Private Profile
# 9.2.1 (L1) Ensure 'Windows Firewall: Private: Firewall state' is set to 'On (recommended)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.2.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile',
  values: {
    name: 'EnableFirewall',
    type: :dword,
    data: 1,
  },
}

# 9.2.2 (L1) Ensure 'Windows Firewall: Private: Inbound connections' is set to 'Block (default)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.2.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile',
  values: {
    name: 'DefaultInboundAction',
    type: :dword,
    data: 1,
  },
}

# 9.2.3 (L1) Ensure 'Windows Firewall: Private: Outbound connections' is set to 'Allow (default)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.2.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile',
  values: {
    name: 'DefaultOutboundAction',
    type: :dword,
    data: 0,
  },
}

# 9.2.4 (L1) Ensure 'Windows Firewall: Private: Settings: Display a notification' is set to 'No'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.2.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile',
  values: {
    name: 'DisableNotifications',
    type: :dword,
    data: 1,
  },
}

# 9.2.5 (L1) Ensure 'Windows Firewall: Private: Settings: Apply local firewall rules' is set to 'Yes (default)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.2.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile',
  values: {
    name: 'AllowLocalPolicyMerge',
    type: :dword,
    data: 1,
  },
}

# 9.2.6 (L1) Ensure 'Windows Firewall: Private: Settings: Apply local connection security rules' is set to 'Yes (default)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.2.6'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile',
  values: {
    name: 'AllowLocalIPsecPolicyMerge',
    type: :dword,
    data: 1,
  },
}

# 9.2.7 (L1) Ensure 'Windows Firewall: Private: Logging: Name' is set to '%SYSTEMROOT%\System32\logfiles\firewall\privatefw.log'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.2.7'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging',
  values: {
    name: 'LogFilePath',
    type: :string,
    data: '%SYSTEMROOT%\System32\LogFiles\Firewall\privatefw.log',
  },
}

# 9.2.8 (L1) Ensure 'Windows Firewall: Private: Logging: Size limit (KB)' is set to '16,384 KB or greater'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.2.8'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging',
  values: {
    name: 'LogFileSize',
    type: :dword,
    data: 16384,
  },
}

# 9.2.9 (L1) Ensure 'Windows Firewall: Private: Logging: Log dropped packets' is set to 'Yes'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.2.9'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging',
  values: {
    name: 'LogDroppedPackets',
    type: :dword,
    data: 1,
  },
}

# 9.2.10 (L1) Ensure 'Windows Firewall: Private: Logging: Log successful connections' is set to 'Yes'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.2.10'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging',
  values: {
    name: 'LogSuccessfulConnections',
    type: :dword,
    data: 1,
  },
}

## 9.3 Public Profile
# 9.3.1 (L1) Ensure 'Windows Firewall: Public: Firewall state' is set to 'On (recommended)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.3.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile',
  values: {
    name: 'EnableFirewall',
    type: :dword,
    data: 1,
  },
}

# 9.3.2 (L1) Ensure 'Windows Firewall: Public: Inbound connections' is set to 'Block (default)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.3.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile',
  values: {
    name: 'DefaultInboundAction',
    type: :dword,
    data: 1,
  },
}

# 9.3.3 (L1) Ensure 'Windows Firewall: Public: Outbound connections' is set to 'Allow (default)'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.3.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile',
  values: {
    name: 'DefaultOutboundAction',
    type: :dword,
    data: 0,
  },
}

# 9.3.4 (L1) Ensure 'Windows Firewall: Public: Settings: Display a notification' is set to 'Yes'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.3.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile',
  values: {
    name: 'DisableNotifications',
    type: :dword,
    data: 0,
  },
}

# 9.3.5 (L1) Ensure 'Windows Firewall: Public: Settings: Apply local firewall rules' is set to 'No'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.3.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile',
  values: {
    name: 'AllowLocalPolicyMerge',
    type: :dword,
    data: 0,
  },
}

# 9.3.6 (L1) Ensure 'Windows Firewall: Public: Settings: Apply local connection security rules' is set to 'No'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.3.6'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile',
  values: {
    name: 'AllowLocalIPsecPolicyMerge',
    type: :dword,
    data: 0,
  },
}

# 9.3.7 (L1) Ensure 'Windows Firewall: Public: Logging: Name' is set to '%SYSTEMROOT%\System32\logfiles\firewall\publicfw.log'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.3.7'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging',
  values: {
    name: 'LogFilePath',
    type: :string,
    data: '%SYSTEMROOT%\System32\LogFiles\Firewall\publicfw.log',
  },
}

# 9.3.8 (L1) Ensure 'Windows Firewall: Public: Logging: Size limit (KB)' is set to '16,384 KB or greater'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.3.8'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging',
  values: {
    name: 'LogFileSize',
    type: :dword,
    data: 16384,
  },
}

# 9.3.9 (L1) Ensure 'Windows Firewall: Public: Logging: Log dropped packets' is set to 'Yes'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.3.9'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging',
  values: {
    name: 'LogDroppedPackets',
    type: :dword,
    data: 1,
  },
}

# 9.3.10 (L1) Ensure 'Windows Firewall: Public: Logging: Log successful connections' is set to 'Yes'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['9.3.10'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging',
  values: {
    name: 'LogSuccessfulConnections',
    type: :dword,
    data: 1,
  },
}

### 17 Advanced Audit Policy Configuration
## 17.1 Account Logon
# 17.1.1 (L1) Ensure 'Audit Credential Validation' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.1.1'] = {
  subcategory: 'Credential Validation',
  success: true,
  failure: true,
}

## 17.2 Account Management
# 17.2.1 (L1) Ensure 'Audit Application Group Management' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.2.1'] = {
  subcategory: 'Application Group Management',
  success: true,
  failure: true,
}

# 17.2.2 (L1) Ensure 'Audit Computer Account Management' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.2.2'] = {
  subcategory: 'Computer Account Management',
  success: true,
  failure: true,
}

# 17.2.3 (L1) Ensure 'Audit Distribution Group Management' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.2.3'] = nil

# 17.2.4 (L1) Ensure 'Audit Other Account Management Events' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.2.4'] = {
  subcategory: 'Other Account Management Events',
  success: true,
  failure: true,
}

# 17.2.5 (L1) Ensure 'Audit Security Group Management' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.2.5'] = {
  subcategory: 'Security Group Management',
  success: true,
  failure: true,
}

# 17.2.6 (L1) Ensure 'Audit User Account Management' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.2.6'] = {
  subcategory: 'User Account Management',
  success: true,
  failure: true,
}

## 17.3 Detailed Tracking
# 17.3.1 (L1) Ensure 'Audit Process Creation' is set to 'Success'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.3.1'] = {
  subcategory: 'Process Creation',
  success: true,
  failure: false,
}

## 17.4 DS Access
# 17.4.1 (L1) Ensure 'Audit Directory Service Access' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.4.1'] = nil

# 17.4.2 (L1) Ensure 'Audit Directory Service Changes' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.4.2'] = nil

## 17.5 Logon/Logoff
# 17.5.1 (L1) Ensure 'Audit Account Lockout' is set to 'Success'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.5.1'] = {
  subcategory: 'Account Lockout',
  success: true,
  failure: false,
}

# 17.5.2 (L1) Ensure 'Audit Logoff' is set to 'Success'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.5.2'] = {
  subcategory: 'Logoff',
  success: true,
  failure: false,
}

# 17.5.3 (L1) Ensure 'Audit Logon' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.5.3'] = {
  subcategory: 'Logon',
  success: true,
  failure: true,
}

# 17.5.4 (L1) Ensure 'Audit Other Logon/Logoff Events' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.5.4'] = {
  subcategory: 'Other Logon/Logoff Events',
  success: true,
  failure: true,
}

# 17.5.5 (L1) Ensure 'Audit Special Logon' is set to 'Success'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.5.5'] = {
  subcategory: 'Special Logon',
  success: true,
  failure: false,
}

## 17.6 Object Access
# 17.6.1 (L1) Ensure 'Audit Removable Storage' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.6.1'] = {
  subcategory: 'Removable Storage',
  success: true,
  failure: true,
}

## 17.7 Policy Change
# 17.7.1 (L1) Ensure 'Audit Audit Policy Change' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.7.1'] = {
  subcategory: 'Audit Policy Change',
  success: true,
  failure: true,
}

# 17.7.2 (L1) Ensure 'Audit Authentication Policy Change' is set to 'Success'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.7.2'] = {
  subcategory: 'Authentication Policy Change',
  success: true,
  failure: false,
}

## 17.8 Privilege Use
# 17.8.1 (L1) Ensure 'Audit Sensitive Privilege Use' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.8.1'] = {
  subcategory: 'Sensitive Privilege Use',
  success: true,
  failure: true,
}

## 17.9 System
# 17.9.1 (L1) Ensure 'Audit IPsec Driver' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.9.1'] = {
  subcategory: 'IPsec Driver',
  success: true,
  failure: true,
}

# 17.9.2 (L1) Ensure 'Audit Other System Events' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.9.2'] = {
  subcategory: 'Other System Events',
  success: true,
  failure: true,
}

# 17.9.3 (L1) Ensure 'Audit Security State Change' is set to 'Success'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.9.3'] = {
  subcategory: 'Security State Change',
  success: true,
  failure: false,
}

# 17.9.4 (L1) Ensure 'Audit Security System Extension' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.9.4'] = {
  subcategory: 'Security System Extension',
  success: true,
  failure: true,
}

# 17.9.5 (L1) Ensure 'Audit System Integrity' is set to 'Success and Failure'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.9.5'] = {
  subcategory: 'System Integrity',
  success: true,
  failure: true,
}

# 18 Administrative Templates (Computer)
## 18.1 Control Panel
## 18.1.1 Personalization
# 18.1.1.1 (L1) Ensure 'Prevent enabling lock screen camera' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.1.1.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization',
  values: {
    name: 'NoLockScreenCamera',
    type: :dword,
    data: 1,
  },
}

# 18.1.1.2 (L1) Ensure 'Prevent enabling lock screen slide show' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.1.1.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization',
  values: {
    name: 'NoLockScreenSlideshow',
    type: :dword,
    data: 1,
  },
}

## 18.2 LAPS - See windows_common_laps.rb attribute file

## 18.3 MSS (Legacy)
# 18.3.1 (L1) Ensure 'MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
  values: {
    name: 'AutoAdminLogon',
    type: :string,
    data: '0',
  },
}

# 18.3.2 (L1) Ensure 'MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)' is set to 'Enabled: Highest protection, source routing is completely disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters',
  values: {
    name: 'DisableIPSourceRouting',
    type: :dword,
    data: 2,
  },
}

# 18.3.3 (L1) Ensure 'MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)' is set to 'Enabled: Highest protection, source routing is completely disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
  values: {
    name: 'DisableIPSourceRouting',
    type: :dword,
    data: 2,
  },
}

# 18.3.4 (L1) Ensure 'MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
  values: {
    name: 'EnableICMPRedirect',
    type: :dword,
    data: 0,
  },
}

# 18.3.5 (L2) Ensure 'MSS: (KeepAliveTime) How often keep-alive packets are sent in milliseconds' is set to 'Enabled: 300,000 or 5 minutes (recommended)'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
  values: {
    name: 'KeepAliveTime',
    type: :dword,
    data: 300000,
  },
}

# 18.3.6 (L1) Ensure 'MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.6'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters',
  values: {
    name: 'NoNameReleaseOnDemand',
    type: :dword,
    data: 1,
  },
}

# 18.3.7 (L2) Ensure 'MSS: (PerformRouterDiscovery) Allow IRDP to detect and configure Default Gateway addresses (could lead to DoS)' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.7'] = nil

# 18.3.8 (L1) Ensure 'MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.8'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager',
  values: {
    name: 'SafeDllSearchMode',
    type: :dword,
    data: 1,
  },
}

# 18.3.9 (L1) Ensure 'MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)' is set to 'Enabled: 5 or fewer seconds'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.9'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
  values: {
    name: 'ScreenSaverGracePeriod',
    type: :string,
    data: '5',
  },
}

# 18.3.10 (L2) Ensure 'MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.10'] = nil

# 18.3.11 (L2) Ensure 'MSS: (TcpMaxDataRetransmissions) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.11'] = nil

# 18.3.12 (L1) Ensure 'MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning' is set to 'Enabled: 90% or less'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.12'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Security',
  values: {
    name: 'WarningLevel',
    type: :dword,
    data: 90,
  },
}

## 18.4 Network
## 18.4.9 Link-Layer Topology Discovery
# 18.4.9.1 (L2) Ensure 'Turn on Mapper I/O (LLTDIO) driver' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.9.1'] = nil

# 18.4.9.2 (L2) Ensure 'Turn on Responder (RSPNDR) driver' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.9.2'] = nil

## 18.4.10 Microsoft Peer-to-Peer Networking Services
# 18.4.10.2 (L2) Ensure 'Turn off Microsoft Peer-to-Peer Networking Services' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.10.2'] = nil

## 18.4.11 Network Connections
# 18.4.11.2 (L1) Ensure 'Prohibit installation and configuration of Network Bridge on your DNS domain network' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.11.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections',
  values: {
    name: 'NC_AllowNetBridge_NLA',
    type: :dword,
    data: 0,
  },
}

# 18.4.11.3 (L1) Ensure 'Require domain users to elevate when setting a network's location' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.11.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections',
  values: {
    name: 'NC_StdDomainUserSetLocation',
    type: :dword,
    data: 1,
  },
}

## 18.4.14 Network Provider
# 18.4.14.1 (L1) Ensure 'Hardened UNC Paths' is set to 'Enabled, with "Require Mutual Authentication" and "Require Integrity" set for all NETLOGON and SYSVOL shares'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.14.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths',
  values: [
    {
      name: '\\\*\NETLOGON',
      type: :string,
      data: 'RequireMutualAuthentication=1,RequireIntegrity=1',
    },
    {
      name: '\\\*\SYSVOL',
      type: :string,
      data: 'RequireMutualAuthentication=1,RequireIntegrity=1',
    },
  ],
}

default['cis-benchmarks']['windows_server_2012r2']['msu_packages']['ms15-011'] = {
  name: 'Security Update for Windows Server 2012 R2 (KB3000483)',
  source: 'https://download.microsoft.com/download/6/9/C/69C5DAFE-FF01-43E8-A356-212932D8E70B/Windows8.1-KB3000483-x64.msu',
  checksum: '02fb4510c1582b7bb36712f0088bd2493d71cf1f0581b29b0f17239cf3b8c282',
}

## 18.4.19 TCPIP Settings
## 18.4.19.2 Parameters
# 18.4.19.2.1 (L2) Disable IPv6 (Ensure TCPIP6 Parameter 'DisabledComponents' is set to '0xff (255)')
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.19.2.1'] = nil

## 18.4.20 Windows Connect Now
# 18.4.20.1 (L2) Ensure 'Configuration of wireless settings using Windows Connect Now' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.20.1'] = nil

# 18.4.20.2 (L2) Ensure 'Prohibit access of the Windows Connect Now wizards' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.20.2'] = nil

## 18.4.21 Windows Connection Manager
# 18.4.21.1 (L1) Ensure 'Minimize the number of simultaneous connections to the Internet or a Windows Domain' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.21.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy',
  values: {
    name: 'fMinimizeConnections',
    type: :dword,
    data: 1,
  },
}

# 18.4.21.2 (L2) Ensure 'Prohibit connection to non-domain networks when connected to domain authenticated network' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.21.2'] = nil

## 18.6 SCM: Pass the Hash Mitigations
# 18.6.1 (L1) Ensure 'Apply UAC restrictions to local accounts on network logons' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.6.1'] = nil

# 18.6.2 (L1) Ensure 'WDigest Authentication' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.6.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest',
  values: {
    name: 'UseLogonCredential',
    type: :dword,
    data: 0,
  },
}

## 18.8 System
## 18.8.3 Audit Process Creation
# 18.8.3.1 (L1) Ensure 'Include command line in process creation events' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.3.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system\Audit',
  values: {
    name: 'ProcessCreationIncludeCmdLine_Enabled',
    type: :dword,
    data: 0,
  },
}

## 18.8.12 Early Launch Antimalware
# 18.8.12.1 (L1) Ensure 'Boot-Start Driver Initialization Policy' is set to 'Enabled: Good, unknown and bad but critical'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.12.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\EarlyLaunch',
  values: {
    name: 'DriverLoadPolicy',
    type: :dword,
    data: 3,
  },
}

## 18.8.19 Group Policy
# 18.8.19.2 (L1) Ensure 'Configure registry policy processing: Do not apply during periodic background processing' is set to 'Enabled: FALSE'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.19.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}',
  values: {
    name: 'NoBackgroundPolicy',
    type: :dword,
    data: 0,
  },
}

# 18.8.19.3 (L1) Ensure 'Configure registry policy processing: Process even if the Group Policy objects have not changed' is set to 'Enabled: TRUE'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.19.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}',
  values: {
    name: 'NoGPOListChanges',
    type: :dword,
    data: 0,
  },
}

# 18.8.19.4 (L1) Ensure 'Turn off background refresh of Group Policy' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.19.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'DisableBkGndGroupPolicy',
    type: :dword,
    data: '',
  },
  recursive: false,
  action: :delete,
}

## 18.8.20 Internet Communication Management
## 18.8.20.1 Internet Communication settings
# 18.8.20.1.1 (L2) Ensure 'Turn off access to the Store' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.1'] = nil

# 18.8.20.1.2 (L2) Ensure 'Turn off downloading of print drivers over HTTP' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.2'] = nil

# 18.8.20.1.3 (L2) Ensure 'Turn off handwriting personalization data sharing' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.3'] = nil

# 18.8.20.1.4 (L2) Ensure 'Turn off handwriting recognition error reporting' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.4'] = nil

# 18.8.20.1.5 (L2) Ensure 'Turn off Internet Connection Wizard if URL connection is referring to Microsoft.com' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.5'] = nil

# 18.8.20.1.6 (L2) Ensure 'Turn off Internet download for Web publishing and online ordering wizards' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.6'] = nil

# 18.8.20.1.7 (L2) Ensure 'Turn off printing over HTTP' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.7'] = nil

# 18.8.20.1.8 (L2) Ensure 'Turn off Registration if URL connection is referring to Microsoft.com' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.8'] = nil

# 18.8.20.1.9 (L2) Ensure 'Turn off Search Companion content file updates' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.9'] = nil

# 18.8.20.1.10 (L2) Ensure 'Turn off the "Order Prints" picture task' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.10'] = nil

# 18.8.20.1.11 (L2) Ensure 'Turn off the "Publish to Web" task for files and folders' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.11'] = nil

# 18.8.20.1.12 (L2) Ensure 'Turn off the Windows Messenger Customer Experience Improvement Program' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.12'] = nil

# 18.8.20.1.13 (L2) Ensure 'Turn off Windows Customer Experience Improvement Program' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.13'] = nil

# 18.8.20.1.14 (L2) Ensure 'Turn off Windows Error Reporting' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.14'] = nil

## 18.8.24 Locale Services
# 18.8.24.1 (L2) Ensure 'Disallow copying of user input methods to the system account for sign-in' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.24.1'] = nil

## 18.8.25 Logon
# 18.8.25.1 (L1) Ensure 'Do not display network selection UI' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.25.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
  values: {
    name: 'DontDisplayNetworkSelectionUI',
    type: :dword,
    data: 1,
  },
}

# 18.8.25.2 (L1) Ensure 'Do not enumerate connected users on domainjoined computers' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.25.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
  values: {
    name: 'DontEnumerateConnectedUsers',
    type: :dword,
    data: 1,
  },
}

# 18.8.25.3 (L1) Ensure 'Enumerate local users on domain-joined computers' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.25.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
  values: {
    name: 'EnumerateLocalUsers',
    type: :dword,
    data: 0,
  },
}

# 18.8.25.4 (L1) Ensure 'Turn off app notifications on the lock screen' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.25.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
  values: {
    name: 'DisableLockScreenAppNotifications',
    type: :dword,
    data: 1,
  },
}

# 18.8.25.5 (L1) Ensure 'Turn on convenience PIN sign-in' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.25.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
  values: {
    name: 'AllowDomainPINLogon',
    type: :dword,
    data: 0,
  },
}

## 18.8.29.5 Sleep Settings
# 18.8.29.5.1 (L2) Ensure 'Require a password when a computer wakes (on battery)' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.29.5.1'] = nil

# 18.8.29.5.2 (L2) Ensure 'Require a password when a computer wakes (plugged in)' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.29.5.2'] = nil

## 18.8.31 Remote Assistance
# 18.8.31.1 (L1) Ensure 'Configure Offer Remote Assistance' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.31.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
  values: {
    name: 'fAllowUnsolicited',
    type: :dword,
    data: 0,
  },
}

# 18.8.31.2 (L1) Ensure 'Configure Solicited Remote Assistance' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.31.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
  values: {
    name: 'fAllowToGetHelp',
    type: :dword,
    data: 0,
  },
}

## 18.8.32 Remote Procedure Call
# 18.8.32.1 (L1) Ensure 'Enable RPC Endpoint Mapper Client Authentication' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.32.1'] = nil

# 18.8.32.2 (L2) Ensure 'Restrict Unauthenticated RPC clients' is set to 'Enabled: Authenticated'
# Profile Applicability:
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.32.2'] = nil

## 18.8.39.5 Microsoft Support Diagnostic Tool
# 18.8.39.5.1 (L2) Ensure 'Microsoft Support Diagnostic Tool: Turn on MSDT interactive communication with support provider' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.39.5.1'] = nil

## 18.8.39.11 Windows Performance PerfTrack
# 18.8.39.11.1 (L2) Ensure 'Enable/Disable PerfTrack' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.39.11.1'] = nil

## 18.8.41 User Profiles
# 18.8.41.1 (L2) Ensure 'Turn off the advertising ID' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.41.1'] = nil

## 18.8.44.1 Time Providers
# 18.8.44.1.1 (L2) Ensure 'Enable Windows NTP Client' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.44.1.1'] = nil

# 18.8.44.1.2 (L2) Ensure 'Enable Windows NTP Server' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.44.1.2'] = nil

## 18.9.6 App runtime
# 18.9.6.1 (L1) Ensure 'Allow Microsoft accounts to be optional' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.6.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'MSAOptional',
    type: :dword,
    data: 1,
  },
}

## 18.9.8 AutoPlay Policies
# 18.9.8.1 (L1) Ensure 'Disallow Autoplay for non-volume devices' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.8.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
  values: {
    name: 'NoAutoplayfornonVolume',
    type: :dword,
    data: 1,
  },
}

# 18.9.8.2 (L1) Ensure 'Set the default behavior for AutoRun' is set to 'Enabled: Do not execute any autorun commands'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.8.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer',
  values: {
    name: 'NoAutorun',
    type: :dword,
    data: 1,
  },
}

# 18.9.8.3 (L1) Ensure 'Turn off Autoplay' is set to 'Enabled: All drives'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.8.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer',
  values: {
    name: 'NoDriveTypeAutoRun',
    type: :dword,
    data: 255,
  },
}

## 18.9.15 Credential User Interface
# 18.9.15.1 (L1) Ensure 'Do not display the password reveal button' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.15.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredUI',
  values: {
    name: 'DisablePasswordReveal',
    type: :dword,
    data: 1,
  },
}

# 18.9.15.2 (L1) Ensure 'Enumerate administrator accounts on elevation' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.15.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\CredUI',
  values: {
    name: 'EnumerateAdministrators',
    type: :dword,
    data: 0,
  },
}

## 18.9.26 Event Log Service
## 18.9.26.1 Application
# 18.9.26.1.1 (L1) Ensure 'Application: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.26.1.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application',
  values: {
    name: 'Retention',
    type: :string,
    data: '0',
  },
}

# 18.9.26.1.2 (L1) Ensure 'Application: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.26.1.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application',
  values: {
    name: 'MaxSize',
    type: :dword,
    data: 32768,
  },
}

## 18.9.26.2 Security
# 18.9.26.2.1 (L1) Ensure 'Security: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.26.2.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security',
  values: {
    name: 'Retention',
    type: :string,
    data: '0',
  },
}

# 18.9.26.2.2 (L1) Ensure 'Security: Specify the maximum log file size (KB)' is set to 'Enabled: 196,608 or greater'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.26.2.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security',
  values: {
    name: 'MaxSize',
    type: :dword,
    data: 196608,
  },
}

## 18.9.26.3 Setup
# 18.9.26.3.1 (L1) Ensure 'Setup: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.26.3.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup',
  values: {
    name: 'Retention',
    type: :string,
    data: '0',
  },
}

# 18.9.26.3.2 (L1) Ensure 'Setup: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.26.3.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup',
  values: {
    name: 'MaxSize',
    type: :dword,
    data: 32768,
  },
}

## 18.9.26.4 System
# 18.9.26.4.1 (L1) Ensure 'System: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.26.4.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System',
  values: {
    name: 'Retention',
    type: :string,
    data: '0',
  },
}

# 18.9.26.4.2 (L1) Ensure 'System: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.26.4.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System',
  values: {
    name: 'MaxSize',
    type: :dword,
    data: 32768,
  },
}

## 18.9.30 File Explorer
# 18.9.30.2 (L1) Ensure 'Configure Windows SmartScreen' is set to 'Enabled: Require approval from an administrator before running downloaded unknown software'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.30.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
  values: {
    name: 'EnableSmartScreen',
    type: :dword,
    data: 2,
  },
}

# 18.9.30.3 (L1) Ensure 'Turn off Data Execution Prevention for Explorer' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.30.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
  values: {
    name: 'NoDataExecutionPrevention',
    type: :dword,
    data: 0,
  },
}

# 18.9.30.4 (L1) Ensure 'Turn off heap termination on corruption' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.30.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
  values: {
    name: 'NoHeapTerminationOnCorruption',
    type: :dword,
    data: 0,
  },
}

# 18.9.30.5 (L1) Ensure 'Turn off shell protocol protected mode' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.30.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer',
  values: {
    name: 'PreXPSP2ShellProtocolBehavior',
    type: :dword,
    data: 0,
  },
}

## 18.9.37 Location and Sensors
# 18.9.37.1 (L2) Ensure 'Turn off location' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.37.1'] = nil

## 18.9.47 OneDrive (formerly SkyDrive)
# 18.9.47.1 (L1) Ensure 'Prevent the usage of OneDrive for file storage' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.47.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive',
  values: {
    name: 'DisableFileSyncNGSC',
    type: :dword,
    data: 1,
  },
}

# 18.9.47.2 (L1) Ensure 'Prevent the usage of OneDrive for file storage on Windows 8.1' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.47.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive',
  values: {
    name: 'DisableFileSync',
    type: :dword,
    data: 1,
  },
}

## 18.9.52.2 Remote Desktop Connection Client
# 18.9.52.2.2 (L1) Ensure 'Do not allow passwords to be saved' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.2.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
  values: {
    name: 'DisablePasswordSaving',
    type: :dword,
    data: 1,
  },
}

## 18.9.52.3.2 Connections
# 18.9.52.3.2.1 (L2) Ensure 'Restrict Remote Desktop Services users to a single Remote Desktop Services session' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.2.1'] = nil

## 18.9.52.3.3 Device and Resource Redirection
# 18.9.52.3.3.1 (L2) Ensure 'Do not allow COM port redirection' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.3.1'] = nil

# 18.9.52.3.3.2 (L1) Ensure 'Do not allow drive redirection' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.3.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
  values: {
    name: 'fDisableCdm',
    type: :dword,
    data: 1,
  },
}

# 18.9.52.3.3.3 (L2) Ensure 'Do not allow LPT port redirection' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.3.3'] = nil

# 18.9.52.3.3.4 (L2) Ensure 'Do not allow supported Plug and Play device redirection' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.3.4'] = nil

## 18.9.52.3.9 Security
# 18.9.52.3.9.1 (L1) Ensure 'Always prompt for password upon connection' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.9.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
  values: {
    name: 'fPromptForPassword',
    type: :dword,
    data: 1,
  },
}

# 18.9.52.3.9.2 (L1) Ensure 'Require secure RPC communication' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.9.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
  values: {
    name: 'fEncryptRPCTraffic',
    type: :dword,
    data: 1,
  },
}

# 18.9.52.3.9.3 (L1) Ensure 'Set client connection encryption level' is set to 'Enabled: High Level'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.9.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
  values: {
    name: 'MinEncryptionLevel',
    type: :dword,
    data: 3,
  },
}

## 18.9.52.3.10 Session Time Limits
# 18.9.52.3.10.1 (L2) Ensure 'Set time limit for active but idle Remote Desktop Services sessions' is set to 'Enabled: 15 minutes or less'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.10.1'] = nil

# 18.9.52.3.10.2 (L2) Ensure 'Set time limit for disconnected sessions' is set to 'Enabled: 1 minute'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.10.2'] = nil

## 18.9.52.3.11 Temporary folders
# 18.9.52.3.11.1 (L1) Ensure 'Do not delete temp folders upon exit' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.11.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
  values: {
    name: 'DeleteTempDirsOnExit',
    type: :dword,
    data: 1,
  },
}

# 18.9.52.3.11.2 (L1) Ensure 'Do not use temporary folders per session' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.11.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
  values: {
    name: 'PerSessionTempDir',
    type: :dword,
    data: 1,
  },
}

## 18.9.53 RSS Feeds
# 18.9.53.1 (L1) Ensure 'Prevent downloading of enclosures' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.53.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds',
  values: {
    name: 'DisableEnclosureDownload',
    type: :dword,
    data: 1,
  },
}

## 18.9.54 Search
# 18.9.54.2 (L1) Ensure 'Allow indexing of encrypted files' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.54.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search',
  values: {
    name: 'AllowIndexingEncryptedStoresOrItems',
    type: :dword,
    data: 0,
  },
}

# 18.9.54.3 (L2) Ensure 'Set what information is shared in Search' is set to 'Enabled: Anonymous info'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.54.3'] = nil

## 18.9.59 Software Protection Platform
# 18.9.59.1 (L2) Ensure 'Turn off KMS Client Online AVS Validation' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.59.1'] = nil

## 18.9.61 Store
# 18.9.61.1 (L1) Ensure 'Turn off Automatic Download and Install of updates' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.61.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore',
  values: {
    name: 'AutoDownload',
    type: :dword,
    data: 4,
  },
}

# 18.9.61.2 (L1) Ensure 'Turn off the offer to update to the latest version of Windows' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.61.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore',
  values: {
    name: 'DisableOSUpgrade',
    type: :dword,
    data: 1,
  },
}

# 18.9.61.3 (L2) Ensure 'Turn off the Store application' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.61.3'] = nil

## 18.9.69.3 MAPS
# 18.9.69.3.1 (L2) Ensure 'Join Microsoft MAPS' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.69.3.1'] = nil

## 18.9.70.2 Consent
# 18.9.70.2.1 (L1) Ensure 'Configure Default consent' is set to 'Enabled: Always ask before sending data'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.70.2.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent',
  values: {
    name: 'DefaultConsent',
    type: :dword,
    data: 1,
  },
}

# 18.9.70.3 (L1) Ensure 'Automatically send memory dumps for OSgenerated error reports' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.70.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting',
  values: {
    name: 'AutoApproveOSDumps',
    type: :dword,
    data: 0,
  },
}

## 18.9.74 Windows Installer
# 18.9.74.1 (L1) Ensure 'Allow user control over installs' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.74.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer',
  values: {
    name: 'EnableUserControl',
    type: :dword,
    data: 0,
  },
}

# 18.9.74.2 (L1) Ensure 'Always install with elevated privileges' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.74.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer',
  values: {
    name: 'AlwaysInstallElevated',
    type: :dword,
    data: 0,
  },
}

# 18.9.74.3 (L2) Ensure 'Prevent Internet Explorer security prompt for Windows Installer scripts' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.74.3'] = nil

## 18.9.75 Windows Logon Options
# 18.9.75.1 (L1) Ensure 'Sign-in last interactive user automatically after a system-initiated restart' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.75.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system',
  values: {
    name: 'DisableAutomaticRestartSignOn',
    type: :dword,
    data: 1,
  },
}

## 18.9.84 Windows PowerShell
# 18.9.84.1 (L1) Ensure 'Turn on PowerShell Script Block Logging' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.84.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging',
  values: {
    name: 'EnableScriptBlockLogging',
    type: :dword,
    data: 0,
  },
}

# 18.9.84.2 (L1) Ensure 'Turn on PowerShell Transcription' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.84.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription',
  values: {
    name: 'EnableTranscripting',
    type: :dword,
    data: 0,
  },
}

## 18.9.86 Windows Remote Management (WinRM)
## 18.9.86.1 WinRM Client
# 18.9.86.1.1 (L1) Ensure 'Allow Basic authentication' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.86.1.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client',
  values: {
    name: 'AllowBasic',
    type: :dword,
    data: 0,
  },
}

# 18.9.86.1.2 (L1) Ensure 'Allow unencrypted traffic' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.86.1.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client',
  values: {
    name: 'AllowUnencryptedTraffic',
    type: :dword,
    data: 0,
  },
}

# 18.9.86.1.3 (L1) Ensure 'Disallow Digest authentication' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.86.1.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client',
  values: {
    name: 'AllowDigest',
    type: :dword,
    data: 0,
  },
}

## 18.9.86.2 WinRM Service
# 18.9.86.2.1 (L1) Ensure 'Allow Basic authentication' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.86.2.1'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service',
  values: {
    name: 'AllowBasic',
    type: :dword,
    data: 0,
  },
}

# 18.9.86.2.2 (L2) Ensure 'Allow remote server management through WinRM' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.86.2.2'] = nil

# 18.9.86.2.3 (L1) Ensure 'Allow unencrypted traffic' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.86.2.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service',
  values: {
    name: 'AllowUnencryptedTraffic',
    type: :dword,
    data: 0,
  },
}

# 18.9.86.2.4 (L1) Ensure 'Disallow WinRM from storing RunAs credentials' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.86.2.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service',
  values: {
    name: 'DisableRunAs',
    type: :dword,
    data: 1,
  },
}

## 18.9.87 Windows Remote Shell
# 18.9.87.1 (L2) Ensure 'Allow Remote Shell Access' is set to 'Disabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.87.1'] = nil

## 18.9.90.1 Defer Windows Updates
# 18.9.90.2 (L1) Ensure 'Configure Automatic Updates' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.90.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU',
  values: {
    name: 'AUOptions',
    type: :dword,
    data: 4,
  },
}

# 18.9.90.3 (L1) Ensure 'Configure Automatic Updates: Scheduled install day' is set to '0 - Every day'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.90.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU',
  values: {
    name: 'ScheduledInstallDay',
    type: :dword,
    data: 0,
  },
}

# 18.9.90.4 (L1) Ensure 'No auto-restart with logged on users for scheduled automatic updates installations' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.90.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU',
  values: {
    name: 'NoAutoRebootWithLoggedOnUsers',
    type: :dword,
    data: 0,
  },
}

## 19.1.3 Personalization
# USER SETTINGS NEED TO BE ENFORCED VIA GROUP POLICY

## 19.5.1 Notifications
# USER SETTINGS NEED TO BE ENFORCED VIA GROUP POLICY

## 19.6.5 Internet Communication Management
## 19.6.5.1 Internet Communication settings
# USER SETTINGS NEED TO BE ENFORCED VIA GROUP POLICY

## 19.7.4 Attachment Manager
# USER SETTINGS NEED TO BE ENFORCED VIA GROUP POLICY

## 19.7.26 Network Sharing
# USER SETTINGS NEED TO BE ENFORCED VIA GROUP POLICY

## 19.7.39 Windows Installer
# USER SETTINGS NEED TO BE ENFORCED VIA GROUP POLICY

## 19.7.43.2 Playback
# USER SETTINGS NEED TO BE ENFORCED VIA GROUP POLICY
