#
# Cookbook:: cis-benchmarks
# Resource:: windows_security_policy
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# Custom resource name
resource_name :windows_security_policy

# Variables
benchmark          = node['cis-benchmarks']['benchmark']
profile            = node['cis-benchmarks']['windows_server_2012r2']['profile']
profile_level      = node['cis-benchmarks']['windows_server_2012r2']['profile_level']
prefix             = "cis-#{benchmark}-#{profile}-#{profile_level}"
database           = "C:\\Windows\\security\\database\\#{prefix}.sdb"
security_template  = "C:\\Windows\\security\\templates\\#{prefix}-security_policy.inf"
log                = "C:\\Windows\\security\\logs\\#{prefix}-chef.log"

# Properties
property :database, String, default: database
property :security_template, String, default: security_template
property :log, String, default: log
property :overwrite, [true, false], default: true

# Actions
default_action :configure

action :configure do
  # Security policy settings template to apply
  template new_resource.security_template do
    action :create
    cookbook node['cis-benchmarks']['windows_server_2012r2']['security_policy']['cookbook']
    source node['cis-benchmarks']['windows_server_2012r2']['security_policy']['source']
    variables(
      security_policy: node['cis-benchmarks']['windows_server_2012r2']['security_policy']
    )
  end

  # Use secedit.exe to apply
  powershell_script "secedit configure #{new_resource.name}" do
    code "secedit /configure /db '#{new_resource.database}' /cfg '#{new_resource.security_template}' /log '#{new_resource.log}' /quiet #{'/overwrite' if new_resource.overwrite}"
    only_if <<-EOH
      Remove-Item -Path '#{new_resource.log}' -Force -Confirm:$false -ErrorAction SilentlyContinue | Out-Null
      secedit /analyze /db '#{new_resource.database}' /cfg '#{new_resource.security_template}' /log '#{new_resource.log}' | Out-Null
      $log = Get-Content '#{new_resource.log}'
      if ($log -match 'Mismatch') { return $true } else { return $false }
    EOH
  end
end
