#
# Cookbook:: cis-benchmarks
# Recipe:: windows_common_emet
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# Install EMET
windows_package node['cis-benchmarks']['windows_common']['emet']['package']['name'] do
  source node['cis-benchmarks']['windows_common']['emet']['package']['source']
  checksum node['cis-benchmarks']['windows_common']['emet']['package']['checksum']
  options '/quiet'
  installer_type :msi
end

# Apply EMET registry settings
emet_reg_keys = node['cis-benchmarks']['windows_common']['emet']['registry_keys']

emet_reg_keys.each do |k, v|
  next if v.nil?

  registry_key "CIS #{k}" do
    key v['name']
    values [
      {
        name: v['values']['name'],
        type: v['values']['type'].to_sym,
        data: v['values']['data'],
      },
    ]
    recursive true
  end
end
