#
# Cookbook:: cis-benchmarks
# Attribute:: windows_server_2012r2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# CIS Microsoft Windows Server 2012 R2 Benchmark v2.2.1
# Valid profiles: member_server | domain_controller
# Valid profile levels: 1 | 2
default['cis-benchmarks']['windows_server_2012r2']['profile'] = 'member_server'
default['cis-benchmarks']['windows_server_2012r2']['profile_level'] = 2

profile = node['cis-benchmarks']['windows_server_2012r2']['profile']
profile_level = node['cis-benchmarks']['windows_server_2012r2']['profile_level']

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
## 2.1 Audit Policy
# 2.2.1 (L1) Ensure 'Access Credential Manager as a trusted caller' is set to 'No One'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeTrustedCredManAccessPrivilege'] = ''

# 2.2.2 (L1) Configure 'Access this computer from the network'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeNetworkLogonRight'] = case profile
                                                                                                                   when 'domain_controller'
                                                                                                                     'Administrators,Authenticated Users,ENTERPRISE DOMAIN CONTROLLERS'
                                                                                                                   when 'member_server'
                                                                                                                     'Administrators,Authenticated Users'
                                                                                                                   end

# 2.2.3 (L1) Ensure 'Act as part of the operating system' is set to 'No One'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeTcbPrivilege'] = ''

# 2.2.4 (L1) Ensure 'Add workstations to domain' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeMachineAccountPrivilege'] = 'Administrators' if profile == 'domain_controller'

# 2.2.5 (L1) Ensure 'Adjust memory quotas for a process' is set to 'Administrators, LOCAL SERVICE, NETWORK SERVICE'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeIncreaseQuotaPrivilege'] = 'Administrators,LOCAL SERVICE,NETWORK SERVICE'

# 2.2.6 (L1) Configure 'Allow log on locally'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeInteractiveLogonRight'] = case profile
                                                                                                                       when 'domain_controller'
                                                                                                                         'Administrators,ENTERPRISE DOMAIN CONTROLLERS'
                                                                                                                       when 'member_server'
                                                                                                                         'Administrators'
                                                                                                                       end

# 2.2.7 (L1) Configure 'Allow log on through Remote Desktop Services'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeRemoteInteractiveLogonRight'] = case profile
                                                                                                                             when 'domain_controller'
                                                                                                                               'Administrators'
                                                                                                                             when 'member_server'
                                                                                                                               'Administrators,Remote Desktop Users'
                                                                                                                             end

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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeDenyNetworkLogonRight'] = case profile
                                                                                                                       when 'domain_controller'
                                                                                                                         'Guests,Local account'
                                                                                                                       when 'member_server'
                                                                                                                         'Guests,Local account and member of Administrators group'
                                                                                                                       end

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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeEnableDelegationPrivilege'] = case profile
                                                                                                                           when 'domain_controller'
                                                                                                                             'Administrators'
                                                                                                                           when 'member_server'
                                                                                                                             ''
                                                                                                                           end

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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBatchLogonRight'] = 'Administrators' if (profile == 'domain_controller') && (profile_level == 2)

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
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeSyncAgentPrivilege'] = '' if profile == 'domain_controller'

# 2.2.40 (L1) Ensure 'Take ownership of files or other objects' is set to 'Administrators'
# Profile Applicability:
#  Level 1 - Domain Controller
#  Level 1 - Member Server
default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeTakeOwnershipPrivilege'] = 'Administrators'
