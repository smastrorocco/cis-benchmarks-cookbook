#
# Cookbook:: cis-benchmarks
# Recipe:: windows_common_laps
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# Install LAPS Client Side Extension
windows_package node['cis-benchmarks']['windows_common']['laps']['cse']['name'] do
  source node['cis-benchmarks']['windows_common']['laps']['cse']['source']
  checksum node['cis-benchmarks']['windows_common']['laps']['cse']['checksum']
  options '/quiet'
  installer_type :msi
end

# Apply LAPS registry settings
laps_reg_keys = node['cis-benchmarks']['windows_common']['laps']['cse']['registry_keys']

laps_reg_keys.each do |k, v|
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
