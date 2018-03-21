#
# Cookbook:: cis-benchmarks
# Recipe:: benchmark_windows_server_2012r2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

profile_name  = node['cis-benchmarks']['windows_server_2012r2']['profile_name']
profile_level = node['cis-benchmarks']['windows_server_2012r2']['profile_level']

# Validate profile attributes
CISBenchmark::Profile::Windows::Helper.validate_profile_name(profile_name)
CISBenchmark::Profile::Windows::Helper.validate_profile_level(profile_level)

# Lazy evaluate attributes based on profile. Porfile level 2 is evaluated first so
# that level 1 attributes don't get evaluated if they are already set by level 2.
include_recipe "cis-benchmarks::_lazy_attributes_windows_server_2012r2_#{profile_name}_level_2" if profile_level == 2
include_recipe "cis-benchmarks::_lazy_attributes_windows_server_2012r2_#{profile_name}_level_1"

# If profile is member_server, install LAPS CSE
include_recipe 'cis-benchmarks::windows_laps' if profile_name == 'member_server'

# EMET
include_recipe 'cis-benchmarks::windows_emet'

# Apply Security Policy settings
prefix            = "cis-windows_server_2012r2-#{profile_name}-#{profile_level}"
database          = "C:\\Windows\\security\\database\\#{prefix}.sdb"
security_template = "C:\\Windows\\security\\templates\\#{prefix}-security_policy.inf"
log               = "C:\\Windows\\security\\logs\\#{prefix}-chef.log"

# Template of security config
template security_template do
  cookbook node['cis-benchmarks']['windows_server_2012r2']['security_policy']['cookbook']
  source node['cis-benchmarks']['windows_server_2012r2']['security_policy']['source']
  variables(security_policy: node['cis-benchmarks']['windows_server_2012r2']['security_policy'])
end

# Use secedit.exe to apply Security Policy
powershell_script "secedit configure #{security_template}" do
  code "secedit /configure /db '#{database}' /cfg '#{security_template}' /log '#{log}' /quiet /overwrite"
  only_if <<-EOH
    Remove-Item -Path '#{log}' -Force -Confirm:$false -ErrorAction SilentlyContinue | Out-Null
    secedit /analyze /db '#{database}' /cfg '#{security_template}' /log '#{log}' | Out-Null
    $log = Get-Content '#{log}'
    if ($log -match 'Mismatch') { return $true } else { return $false }
  EOH
end

# Alter Administrator and Guest descriptions from default
new_admin_user = node['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['NewAdministratorName']
new_admin_desc = node['cis-benchmarks']['windows_server_2012r2']['security_policy']['NewAdministratorDescription']
new_guest_user = node['cis-benchmarks']['windows_server_2012r2']['security_policy']['system_access']['NewGuestName']
new_guest_desc = node['cis-benchmarks']['windows_server_2012r2']['security_policy']['NewGuestDescription']

powershell_script "Set #{new_admin_user} account description" do
  code "NET USER #{new_admin_user} /COMMENT:'#{new_admin_desc}'"
  not_if <<-EOH
    $adminUser = Get-WmiObject Win32_UserAccount | Where { ($_.LocalAccount -eq $true) -and ($_.Name -eq '#{new_admin_user}') }
    if (($adminUser -eq $null) -or ($adminUser.Description -eq '#{new_admin_desc}')) { return $true } else { return $false }
  EOH
end

powershell_script "Set #{new_guest_user} account description" do
  code "NET USER #{new_guest_user} /COMMENT:'#{new_guest_desc}'"
  not_if <<-EOH
    $adminUser = Get-WmiObject Win32_UserAccount | Where { ($_.LocalAccount -eq $true) -and ($_.Name -eq '#{new_guest_user}') }
    if (($adminUser -eq $null) -or ($adminUser.Description -eq '#{new_guest_desc}')) { return $true } else { return $false }
  EOH
end

# Apply Audit Policy settings
audit_policy = node['cis-benchmarks']['windows_server_2012r2']['audit_policy']

audit_policy.each do |k, v|
  next if v.nil?

  subcategory = v['subcategory']
  success = CISBenchmark::Profile::Windows::Helper.translate_auditpol_setting(v['success'])
  failure = CISBenchmark::Profile::Windows::Helper.translate_auditpol_setting(v['failure'])
  inclusion_setting = CISBenchmark::Profile::Windows::Helper.translate_auditpol_inclusion_setting(v['success'], v['failure'])

  # Use auditpol to apply Audit Policy
  powershell_script "auditpol - CIS #{k}" do
    code "auditpol /set /subcategory:'#{subcategory}' /success:'#{success}' /failure:'#{failure}'"
    not_if <<-EOH
      $auditpol = auditpol /get /subcategory:'#{subcategory}' /r | ConvertFrom-Csv
      if ($auditpol.'Inclusion Setting' -eq '#{inclusion_setting}') { return $true } else { return $false }
    EOH
  end
end

# Apply registry settings
reg_keys = node['cis-benchmarks']['windows_server_2012r2']['registry_keys']

reg_keys.each do |k, v|
  next if v.to_s.empty?

  # Build array of values and ensure type value is symbol
  reg_keys_values = []
  [v['values']].flatten(1).each do |value|
    reg_keys_values.push(name: value['name'], type: value['type'].to_sym, data: value['data'])
  end

  registry_key "CIS #{k}" do
    key v['name']
    values reg_keys_values
    recursive v.key?('recursive') ? v['recursive'] : true
    action v.key?('action') ? v['action'].to_sym : :create
  end
end

# If 18.4.14.1 is defined, we need to ensure MS15-011 is installed
msu_package node['cis-benchmarks']['windows_server_2012r2']['msu_packages']['ms15-011']['name'] do
  source node['cis-benchmarks']['windows_server_2012r2']['msu_packages']['ms15-011']['source']
  checksum node['cis-benchmarks']['windows_server_2012r2']['msu_packages']['ms15-011']['checksum']
  action :install
  not_if { reg_keys['18.4.14.1'].to_s.empty? }
end
