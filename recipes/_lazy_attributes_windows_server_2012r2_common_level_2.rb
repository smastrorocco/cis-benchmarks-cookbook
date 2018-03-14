#
# Cookbook:: cis-benchmarks
# Recipe:: _lazy_attributes_windows_server_2012r2_common_level_2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# 2.3.10.4 (L2) Ensure 'Network access: Do not allow storage of passwords and credentials for network authentication' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.4'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['2.3.10.4'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    values: {
      name: 'disabledomaincreds',
      type: :dword,
      data: 1,
    },
  }
end

# 18.3.7 (L2) Ensure 'MSS: (PerformRouterDiscovery) Allow IRDP to detect and configure Default Gateway addresses (could lead to DoS)' is set to 'Disabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.7'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.7'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
    values: {
      name: 'PerformRouterDiscovery',
      type: :dword,
      data: 0,
    },
  }
end

# 18.3.10 (L2) Ensure 'MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.10'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.10'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters',
    values: {
      name: 'TcpMaxDataRetransmissions',
      type: :dword,
      data: 3,
    },
  }
end

# 18.3.11 (L2) Ensure 'MSS: (TcpMaxDataRetransmissions) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.11'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.3.11'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
    values: {
      name: 'TcpMaxDataRetransmissions',
      type: :dword,
      data: 3,
    },
  }
end

# 18.4.9.1 (L2) Ensure 'Turn on Mapper I/O (LLTDIO) driver' is set to 'Disabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.9.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.9.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD',
    values: [
      {
        name: 'AllowLLTDIOOnDomain',
        type: :dword,
        data: 0,
      },
      {
        name: 'AllowLLTDIOOnPublicNet',
        type: :dword,
        data: 0,
      },
      {
        name: 'EnableLLTDIO',
        type: :dword,
        data: 0,
      },
      {
        name: 'ProhibitLLTDIOOnPrivateNet',
        type: :dword,
        data: 0,
      },
    ],
  }
end

# 18.4.9.2 (L2) Ensure 'Turn on Responder (RSPNDR) driver' is set to 'Disabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.9.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.9.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD',
    values: [
      {
        name: 'AllowRspndrOnDomain',
        type: :dword,
        data: 0,
      },
      {
        name: 'AllowRspndrOnPublicNet',
        type: :dword,
        data: 0,
      },
      {
        name: 'EnableRspndr',
        type: :dword,
        data: 0,
      },
      {
        name: 'ProhibitRspndrOnPrivateNet',
        type: :dword,
        data: 0,
      },
    ],
  }
end

# 18.4.10.2 (L2) Ensure 'Turn off Microsoft Peer-to-Peer Networking Services' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.10.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.10.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Peernet',
    values: {
      name: 'Disabled',
      type: :dword,
      data: 1,
    },
  }
end

# 18.4.19.2.1 (L2) Disable IPv6 (Ensure TCPIP6 Parameter 'DisabledComponents' is set to '0xff (255)')
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.19.2.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.19.2.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters',
    values: {
      name: 'DisabledComponents',
      type: :dword,
      data: 255,
    },
  }
end

# 18.4.20.1 (L2) Ensure 'Configuration of wireless settings using Windows Connect Now' is set to 'Disabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.20.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.20.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars',
    values: [
      {
        name: 'DisableFlashConfigRegistrar',
        type: :dword,
        data: 0,
      },
      {
        name: 'DisableInBand802DOT11Registrar',
        type: :dword,
        data: 0,
      },
      {
        name: 'DisableUPnPRegistrar',
        type: :dword,
        data: 0,
      },
      {
        name: 'DisableWPDRegistrar',
        type: :dword,
        data: 0,
      },
      {
        name: 'EnableRegistrars',
        type: :dword,
        data: 0,
      },
    ],
  }
end

# 18.4.20.2 (L2) Ensure 'Prohibit access of the Windows Connect Now wizards' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.20.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.4.20.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\UI',
    values: {
      name: 'DisableWcnUi',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.1 (L2) Ensure 'Turn off access to the Store' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
    values: {
      name: 'NoUseStoreOpenWith',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.2 (L2) Ensure 'Turn off downloading of print drivers over HTTP' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers',
    values: {
      name: 'DisableWebPnPDownload',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.3 (L2) Ensure 'Turn off handwriting personalization data sharing' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.3'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.3'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TabletPC',
    values: {
      name: 'PreventHandwritingDataSharing',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.4 (L2) Ensure 'Turn off handwriting recognition error reporting' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.4'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.4'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports',
    values: {
      name: 'PreventHandwritingErrorReports',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.5 (L2) Ensure 'Turn off Internet Connection Wizard if URL connection is referring to Microsoft.com' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.5'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.5'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard',
    values: {
      name: 'ExitOnMSICW',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.6 (L2) Ensure 'Turn off Internet download for Web publishing and online ordering wizards' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.6'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.6'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer',
    values: {
      name: 'NoWebServices',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.7 (L2) Ensure 'Turn off printing over HTTP' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.7'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.7'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers',
    values: {
      name: 'DisableHTTPPrinting',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.8 (L2) Ensure 'Turn off Registration if URL connection is referring to Microsoft.com' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.8'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.8'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control',
    values: {
      name: 'NoRegistration',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.9 (L2) Ensure 'Turn off Search Companion content file updates' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.9'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.9'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SearchCompanion',
    values: {
      name: 'DisableContentFileUpdates',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.10 (L2) Ensure 'Turn off the "Order Prints" picture task' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.10'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.10'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer',
    values: {
      name: 'NoOnlinePrintsWizard',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.11 (L2) Ensure 'Turn off the "Publish to Web" task for files and folders' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.11'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.11'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer',
    values: {
      name: 'NoPublishingWizard',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.20.1.12 (L2) Ensure 'Turn off the Windows Messenger Customer Experience Improvement Program' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.12'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.12'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client',
    values: {
      name: 'CEIP',
      type: :dword,
      data: 2,
    },
  }
end

# 18.8.20.1.13 (L2) Ensure 'Turn off Windows Customer Experience Improvement Program' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.13'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.13'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows',
    values: {
      name: 'CEIPEnable',
      type: :dword,
      data: 0,
    },
  }
end

# 18.8.20.1.14 (L2) Ensure 'Turn off Windows Error Reporting' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.14'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.20.1.14'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting',
    values: {
      name: 'Disabled',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.24.1 (L2) Ensure 'Disallow copying of user input methods to the system account for sign-in' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.24.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.24.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Control Panel\International',
    values: {
      name: 'BlockUserInputMethodsForSignIn',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.29.5.1 (L2) Ensure 'Require a password when a computer wakes (on battery)' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.29.5.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.29.5.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51',
    values: {
      name: 'DCSettingIndex',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.29.5.2 (L2) Ensure 'Require a password when a computer wakes (plugged in)' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.29.5.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.29.5.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51',
    values: {
      name: 'ACSettingIndex',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.39.5.1 (L2) Ensure 'Microsoft Support Diagnostic Tool: Turn on MSDT interactive communication with support provider' is set to 'Disabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.39.5.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.39.5.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy',
    values: {
      name: 'DisableQueryRemoteServer',
      type: :dword,
      data: 0,
    },
  }
end

# 18.8.39.11.1 (L2) Ensure 'Enable/Disable PerfTrack' is set to 'Disabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.39.11.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.39.11.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}',
    values: {
      name: 'ScenarioExecutionEnabled',
      type: :dword,
      data: 0,
    },
  }
end

# 18.8.41.1 (L2) Ensure 'Turn off the advertising ID' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.41.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.41.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo',
    values: {
      name: 'DisabledByGroupPolicy',
      type: :dword,
      data: 1,
    },
  }
end

# 18.8.44.1.1 (L2) Ensure 'Enable Windows NTP Client' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.44.1.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.8.44.1.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32time\TimeProviders\NtpClient',
    values: {
      name: 'Enabled',
      type: :dword,
      data: 1,
    },
  }
end

# 18.9.37.1 (L2) Ensure 'Turn off location' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.37.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.37.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors',
    values: {
      name: 'DisableLocation',
      type: :dword,
      data: 1,
    },
  }
end

# 18.9.52.3.2.1 (L2) Ensure 'Restrict Remote Desktop Services users to a single Remote Desktop Services session' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.2.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.2.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    values: {
      name: 'fSingleSessionPerUser',
      type: :dword,
      data: 1,
    },
  }
end

# 18.9.52.3.3.1 (L2) Ensure 'Do not allow COM port redirection' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.3.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.3.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    values: {
      name: 'fDisableCcm',
      type: :dword,
      data: 1,
    },
  }
end

# 18.9.52.3.3.3 (L2) Ensure 'Do not allow LPT port redirection' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.3.3'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.3.3'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    values: {
      name: 'fDisableLPT',
      type: :dword,
      data: 1,
    },
  }
end

# 18.9.52.3.3.4 (L2) Ensure 'Do not allow supported Plug and Play device redirection' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.3.4'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.3.4'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    values: {
      name: 'fDisablePNPRedir',
      type: :dword,
      data: 1,
    },
  }
end

# 18.9.52.3.10.1 (L2) Ensure 'Set time limit for active but idle Remote Desktop Services sessions' is set to 'Enabled: 15 minutes or less'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.10.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.10.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    values: {
      name: 'MaxIdleTime',
      type: :dword,
      data: 900000,
    },
  }
end

# 18.9.52.3.10.2 (L2) Ensure 'Set time limit for disconnected sessions' is set to 'Enabled: 1 minute'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.10.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.52.3.10.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    values: {
      name: 'MaxDisconnectionTime',
      type: :dword,
      data: 60000,
    },
  }
end

# 18.9.54.3 (L2) Ensure 'Set what information is shared in Search' is set to 'Enabled: Anonymous info'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.54.3'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.54.3'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search',
    values: {
      name: 'ConnectedSearchPrivacy',
      type: :dword,
      data: 3,
    },
  }
end

# 18.9.59.1 (L2) Ensure 'Turn off KMS Client Online AVS Validation' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.59.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.59.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform',
    values: {
      name: 'NoGenTicket',
      type: :dword,
      data: 1,
    },
  }
end

# 18.9.61.3 (L2) Ensure 'Turn off the Store application' is set to 'Enabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.61.3'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.61.3'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore',
    values: {
      name: 'RemoveWindowsStore',
      type: :dword,
      data: 1,
    },
  }
end

# 18.9.69.3.1 (L2) Ensure 'Join Microsoft MAPS' is set to 'Disabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.69.3.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.69.3.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet',
    values: {
      name: 'SpynetReporting',
      type: :dword,
      data: 0,
    },
  }
end

# 18.9.74.3 (L2) Ensure 'Prevent Internet Explorer security prompt for Windows Installer scripts' is set to 'Disabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.74.3'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.74.3'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer',
    values: {
      name: 'SafeForScripting',
      type: :dword,
      data: 0,
    },
  }
end

# 18.9.86.2.2 (L2) Ensure 'Allow remote server management through WinRM' is set to 'Disabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.86.2.2'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.86.2.2'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service',
    values: {
      name: 'AllowAutoConfig',
      type: :dword,
      data: 0,
    },
  }
end

# 18.9.87.1 (L2) Ensure 'Allow Remote Shell Access' is set to 'Disabled'
if node['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.87.1'].nil?
  node.default['cis-benchmarks']['windows_server_2012r2']['registry_keys']['18.9.87.1'] = {
    name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS',
    values: {
      name: 'AllowRemoteShellAccess',
      type: :dword,
      data: 0,
    },
  }
end
