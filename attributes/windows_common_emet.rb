#
# Cookbook:: cis-benchmarks
# Attribute:: windows_common_emet
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

return unless node['platform'] == 'windows'

## 18.9.24 EMET
# 18.9.24.1 (L1) Ensure 'EMET 5.51' or higher is installed
# Profile Applicability:
# -- Level 1 - Domain Controller
# -- Level 1 - Member Server
default['cis-benchmarks']['windows_common']['emet']['package'] = {
  name: 'EMET 5.52',
  source: 'https://download.microsoft.com/download/F/3/6/F366901C-F3CB-4A94-B377-5611740B8B19/EMET%20Setup.msi',
  checksum: '419740d3f8557a0c93b9181a5eaabb12a2b4a7a6843e83b02dfb4b080fbc31de',
}

# 18.9.24.2 (L1) Ensure 'Default Action and Mitigation Settings' is set to 'Enabled' (plus subsettings)
# Profile Applicability:
# -- Level 1 - Domain Controller
# -- Level 1 - Member Server
default['cis-benchmarks']['windows_common']['emet']['registry_keys']['18.9.24.2'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings',
  values: [
    {
      name: 'AntiDetours',
      type: :dword,
      data: 1,
    },
    {
      name: 'BannedFunctions',
      type: :dword,
      data: 1,
    },
    {
      name: 'DeepHooks',
      type: :dword,
      data: 1,
    },
    {
      name: 'ExploitAction',
      type: :dword,
      data: 2,
    },
  ],
}

# 18.9.24.3 (L1) Ensure 'Default Protections for Internet Explorer' is set to 'Enabled'
# Profile Applicability:
# -- Level 1 - Domain Controller
# -- Level 1 - Member Server
default['cis-benchmarks']['windows_common']['emet']['registry_keys']['18.9.24.3'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
  values: {
    name: '*\Internet Explorer\iexplore.exe',
    type: :string,
    data: '+EAF+ eaf_modules:mshtml.dll;flash*.ocx;jscript*.dll;vbscript.dll;vgx.dll +ASR asr_modules:npjpi*.dll;jp2iexp.dll;vgx.dll;msxml4*.dll;wshom.ocx;scrrun.dll;vbscript.dll asr_zones:1;2',
  },
}

# 18.9.24.4 (L1) Ensure 'Default Protections for Popular Software' is set to 'Enabled'
# Profile Applicability:
# -- Level 1 - Domain Controller
# -- Level 1 - Member Server
default['cis-benchmarks']['windows_common']['emet']['registry_keys']['18.9.24.4'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
  values: [
    {
      name: '*\7-Zip\7z.exe',
      type: :string,
      data: '-EAF',
    },
    {
      name: '*\7-Zip\7zFM.exe',
      type: :string,
      data: '-EAF',
    },
    {
      name: '*\7-Zip\7zG.exe',
      type: :string,
      data: '-EAF',
    },
    {
      name: '*\Adobe\Adobe Photoshop CS*\Photoshop.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Foxit Reader\Foxit Reader.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Google\Chrome\Application\chrome.exe',
      type: :string,
      data: '+EAF+ eaf_modules:chrome_child.dll',
    },
    {
      name: '*\Google\Google Talk\googletalk.exe',
      type: :string,
      data: '-DEP',
    },
    {
      name: '*\iTunes\iTunes.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Microsoft Lync\communicator.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\mIRC\mirc.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Mozilla Firefox\firefox.exe',
      type: :string,
      data: '+EAF+ eaf_modules:mozjs.dll;xul.dll',
    },
    {
      name: '*\Mozilla Firefox\plugin-container.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Mozilla Thunderbird\plugin-container.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Mozilla Thunderbird\thunderbird.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Opera\*\opera.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Opera\opera.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Pidgin\pidgin.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\QuickTime\QuickTimePlayer.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Real\RealPlayer\realconverter.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Real\RealPlayer\realplay.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Safari\Safari.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\SkyDrive\SkyDrive.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Skype\Phone\Skype.exe',
      type: :string,
      data: '-EAF',
    },
    {
      name: '*\VideoLAN\VLC\vlc.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Winamp\winamp.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Windows Live\Mail\wlmail.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Windows Live\Photo Gallery\WLXPhotoGallery.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Windows Live\Writer\WindowsLiveWriter.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\Windows Media Player\wmplayer.exe',
      type: :string,
      data: '-EAF -MandatoryASLR',
    },
    {
      name: '*\WinRAR\rar.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\WinRAR\unrar.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\WinRAR\winrar.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\WinZip\winzip32.exe',
      type: :string,
      data: '',
    },
    {
      name: '*\WinZip\winzip64.exe',
      type: :string,
      data: '',
    },
  ],
}

# 18.9.24.5 (L1) Ensure 'Default Protections for Recommended Software' is set to 'Enabled'
# Profile Applicability:
# -- Level 1 - Domain Controller
# -- Level 1 - Member Server
default['cis-benchmarks']['windows_common']['emet']['registry_keys']['18.9.24.5'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\Defaults',
  values: [
    {
      name: '*\Adobe\*\Reader\AcroRd32.exe',
      type: :string,
      data: '+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api',
    },
    {
      name: '*\Adobe\Acrobat*\Acrobat\Acrobat.exe',
      type: :string,
      data: '+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api',
    },
    {
      name: '*\Java\jre*\bin\java.exe',
      type: :string,
      data: '-HeapSpray',
    },
    {
      name: '*\Java\jre*\bin\javaw.exe',
      type: :string,
      data: '-HeapSpray',
    },
    {
      name: '*\Java\jre*\bin\javaws.exe',
      type: :string,
      data: '-HeapSpray',
    },
    {
      name: '*\OFFICE1*\EXCEL.EXE',
      type: :string,
      data: '+ASR asr_modules:flash*.ocx',
    },
    {
      name: '*\OFFICE1*\INFOPATH.EXE',
      type: :string,
      data: '',
    },
    {
      name: '*\OFFICE1*\LYNC.EXE',
      type: :string,
      data: '',
    },
    {
      name: '*\OFFICE1*\MSACCESS.EXE',
      type: :string,
      data: '',
    },
    {
      name: '*\OFFICE1*\MSPUB.EXE',
      type: :string,
      data: '',
    },
    {
      name: '*\OFFICE1*\OIS.EXE',
      type: :string,
      data: '',
    },
    {
      name: '*\OFFICE1*\OUTLOOK.EXE',
      type: :string,
      data: '',
    },
    {
      name: '*\OFFICE1*\POWERPNT.EXE',
      type: :string,
      data: '+ASR asr_modules:flash*.ocx',
    },
    {
      name: '*\OFFICE1*\PPTVIEW.EXE',
      type: :string,
      data: '',
    },
    {
      name: '*\OFFICE1*\VISIO.EXE',
      type: :string,
      data: '',
    },
    {
      name: '*\OFFICE1*\VPREVIEW.EXE',
      type: :string,
      data: '',
    },
    {
      name: '*\OFFICE1*\WINWORD.EXE',
      type: :string,
      data: '+ASR asr_modules:flash*.ocx',
    },
    {
      name: '*\Windows NT\Accessories\wordpad.exe',
      type: :string,
      data: '',
    },
  ],
}

# 18.9.24.6 (L1) Ensure 'System ASLR' is set to 'Enabled: Application OptIn'
# Profile Applicability:
# -- Level 1 - Domain Controller
# -- Level 1 - Member Server
default['cis-benchmarks']['windows_common']['emet']['registry_keys']['18.9.24.6'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings',
  values: {
    name: 'ASLR',
    type: :dword,
    data: 3,
  },
}

# 18.9.24.7 (L1) Ensure 'System DEP' is set to 'Enabled: Application OptOut'
# Profile Applicability:
# -- Level 1 - Domain Controller
# -- Level 1 - Member Server
default['cis-benchmarks']['windows_common']['emet']['registry_keys']['18.9.24.7'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings',
  values: {
    name: 'DEP',
    type: :dword,
    data: 2,
  },
}

# 18.9.24.8 (L1) Ensure 'System SEHOP' is set to 'Enabled: Application OptOut'
# Profile Applicability:
# -- Level 1 - Domain Controller
# -- Level 1 - Member Server
default['cis-benchmarks']['windows_common']['emet']['registry_keys']['18.9.24.8'] = {
  name: 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EMET\SysSettings',
  values: {
    name: 'SEHOP',
    type: :dword,
    data: 2,
  },
}
