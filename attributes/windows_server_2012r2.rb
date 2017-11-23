#
# Cookbook:: cis-benchmarks
# Attribute:: windows_server_2012r2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.1.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.1.4'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.2.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.2.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.4.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.4.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.5.1'] = nil

# 2.3.5.2 (L1) Ensure 'Domain controller: LDAP server signing requirements' is set to 'Require signing'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.5.2'] = nil

# 2.3.5.3 (L1) Ensure 'Domain controller: Refuse machine account password changes' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.5.3'] = nil

## 2.3.6 Domain member
# 2.3.6.1 (L1) Ensure 'Domain member: Digitally encrypt or sign secure channel data (always)' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.6.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.6.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.6.3'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.6.4'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.6.5'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.6.6'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.3'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.4'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.5'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.6'] = nil

# 2.3.7.7 (L1) Ensure 'Interactive logon: Prompt user to change password before expiration' is set to 'between 5 and 14 days'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.7'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.8'] = nil

# 2.3.7.9 (L1) Ensure 'Interactive logon: Smart card removal behavior' is set to 'Lock Workstation' or higher
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.7.9'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.8.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.8.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.8.3'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.9.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.9.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.9.3'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.9.4'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.9.5'] = nil

## 2.3.10 Network access
# 2.3.10.1 (L1) Ensure 'Network access: Allow anonymous SID/Name translation' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['LSAAnonymousNameLookup'] = 0

# 2.3.10.2 (L1) Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.2'] = nil

# 2.3.10.3 (L1) Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts and shares' is set to 'Enabled'
# Profile Applicability:
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.3'] = nil

# 2.3.10.4 (L2) Ensure 'Network access: Do not allow storage of passwords and credentials for network authentication' is set to 'Enabled'
# Profile Applicability:
#  Level 2 - Domain Controller
#  Level 2 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.4'] = nil

# 2.3.10.5 (L1) Ensure 'Network access: Let Everyone permissions apply to anonymous users' is set to 'Disabled'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.5'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.6'] = nil

# 2.3.10.7 (L1) Configure 'Network access: Remotely accessible registry paths'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.7'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.8'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.9'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.10'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.10.11'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.11.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.11.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.11.3'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.11.4'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.11.5'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.11.6'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.11.7'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.11.8'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.11.9'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.11.10'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.13.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.15.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.15.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.17.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.17.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.17.3'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.17.4'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.17.5'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.17.6'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.17.7'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.17.8'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['2.3.17.9'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['9.1.1'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['9.1.2'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['9.1.3'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['9.1.4'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['9.1.5'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['9.1.6'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['9.1.7'] = {
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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['registry_keys']['9.1.8'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging',
  values: {
    name: 'LogFileSize',
    type: :dword,
    data: 16384,
  },
}
