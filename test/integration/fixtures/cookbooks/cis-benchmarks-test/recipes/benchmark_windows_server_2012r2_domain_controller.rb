#
# Cookbook:: cis-benchmarks-test
# Recipe:: benchmark_windows_server_2012r2_domain_controller
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# Configure LCM for chef-client
powershell_script 'Configure the LCM' do
  code <<-EOH
      configuration ConfigLCM
      {
          Node "localhost"
          {
              LocalConfigurationManager {
                  ConfigurationMode  = "ApplyOnly"
                  RebootNodeIfNeeded = $false
              }
          }
      }
      ConfigLCM -OutputPath "#{Chef::Config[:file_cache_path]}\\ConfigLCM"
      Set-DscLocalConfigurationManager -Path "#{Chef::Config[:file_cache_path]}\\ConfigLCM"
    EOH
  not_if <<-EOH
      $lcm = Get-DscLocalConfigurationManager
      (($lcm.ConfigurationMode -eq "ApplyOnly") -and ($lcm.RebootNodeIfNeeded -eq $false))
    EOH
end

# Install Nuget Provider and DSC module xActive directory
powershell_script 'Install Nuget Provider' do
  code 'Install-PackageProvider -Name NuGet -Force -Confirm:$false'
  not_if <<-EOH
    $provider = Get-PackageProvider -Name NuGet -ListAvailable -ErrorAction SilentlyContinue
    if ($provider -eq $null) { return $false } else { return $true }
  EOH
end

powershell_script 'Install xActiveDirectory 2.17.0.0' do
  code 'Install-Module -Name xActiveDirectory -RequiredVersion 2.17.0.0 -Force -Confirm:$false'
  not_if <<-EOH
    $module = Get-InstalledModule -Name xActiveDirectory -RequiredVersion 2.17.0.0 -ErrorAction SilentlyContinue
    if ($module -eq $null) { return $false } else { return $true }
  EOH
end

# Install dependencies
windows_feature 'AD-Domain-Services' do
  install_method :windows_feature_powershell
end

powershell_script 'Promote to Domain Controller' do
  code <<-EOH
    Import-Module ADDSDeployment
    Install-ADDSForest `
      -SafeModeAdministratorPassword (ConvertTo-SecureString 'SuperSecurePassword123!' -AsPlainText -Force) `
      -CreateDnsDelegation:$false `
      -DatabasePath "C:\\Windows\\NTDS" `
      -DomainMode "Win2012R2" `
      -DomainName "fake.local" `
      -DomainNetbiosName "FAKE" `
      -ForestMode "Win2012R2" `
      -InstallDns:$true `
      -LogPath "C:\\Windows\\NTDS" `
      -NoRebootOnCompletion:$true `
      -SysvolPath "C:\\Windows\\SYSVOL" `
      -Force:$true `
      -Confirm:$false
  EOH
  not_if { ::File.exist?("#{Chef::Config[:file_cache_path]}\\reboot.txt") }
end

# # Promote to Domain Controller, reboot if changed
# dsc_resource 'xActiveDirectory' do
#   module_name 'xActiveDirectory'
#   module_version '2.17.0.0'
#   resource 'xADDomain'
#   property :DomainName, 'fake.local'
#   property :DomainAdministratorCredential, ps_credential('Administrator', 'SuperSecurePassword123!')
#   property :SafemodeAdministratorPassword, ps_credential('SuperSecurePassword123!')
# end

# Workaround to DC promotion kicking us out of WinRM
file "#{Chef::Config[:file_cache_path]}\\reboot.txt" do
  content 'Reboot trigger'
  notifies :reboot_now, 'reboot[Reboot for Domain Controller Promotion]', :immediately
end

reboot 'Reboot for Domain Controller Promotion' do
  action :nothing
end

# Converge cookbook
include_recipe 'cis-benchmarks::default'
