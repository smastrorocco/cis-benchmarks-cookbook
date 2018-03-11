#
# Cookbook:: cis-benchmarks
# Recipe:: _lazy_attributes_windows_server_2012r2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

profile_name  = node['cis-benchmarks']['windows_server_2012r2']['profile_name']
profile_level = node['cis-benchmarks']['windows_server_2012r2']['profile_level']

# TODO: Make this not disgusting
# TODO: Fix structure, doesn't even properly apply all domain controller stuff
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

  # Level 2
  if profile_level == 2
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

  if node['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.2.3'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.2.3'] = {
      subcategory: 'Distribution Group Management',
      success: true,
      failure: true,
    }
  end

  if node['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.4.1'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.4.1'] = {
      subcategory: 'Directory Service Access',
      success: true,
      failure: true,
    }
  end

  if node['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.4.2'].nil?
    node.default['cis-benchmarks']['windows_server_2012r2']['audit_policy']['17.4.2'] = {
      subcategory: 'Directory Service Changes',
      success: true,
      failure: true,
    }
  end

  # Level 2
  if profile_level == 2
    if node['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBatchLogonRight'].nil?
      node.default['cis-benchmarks']['windows_server_2012r2']['security_policy']['privilege_rights']['SeBatchLogonRight'] = 'Administrators'
    end
  end
end
