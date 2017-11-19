#
# Cookbook:: cis-benchmarks
# Recipe:: windows_server_2012r2
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# Helper library
extend CISBenchmark::Profile::Windows::Helper

# Validate profile attributes
profile_name  = node['cis-benchmarks']['windows_server_2012r2']['profile_name']
profile_level = node['cis-benchmarks']['windows_server_2012r2']['profile_level']

validate_profile_name(profile_name)
validate_profile_level(profile_level)

# Lazy evaluate attributes based on profile
include_recipe 'cis-benchmarks::_lazy_attributes_windows_server_2012r2'

# Variables
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

# Use secedit.exe to apply config
powershell_script "secedit configure #{prefix}" do
  code "secedit /configure /db '#{database}' /cfg '#{security_template}' /log '#{log}' /quiet /overwrite"
  only_if <<-EOH
    Remove-Item -Path '#{log}' -Force -Confirm:$false -ErrorAction SilentlyContinue | Out-Null
    secedit /analyze /db '#{database}' /cfg '#{security_template}' /log '#{log}' | Out-Null
    $log = Get-Content '#{log}'
    if ($log -match 'Mismatch') { return $true } else { return $false }
  EOH
end
