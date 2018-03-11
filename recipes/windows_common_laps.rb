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

  # Build array of values and ensure type value is symbol
  laps_reg_keys_values = []
  [v['values']].flatten(1).each do |value|
    laps_reg_keys_values.push(name: value['name'], type: value['type'].to_sym, data: value['data'])
  end

  registry_key "CIS #{k}" do
    key v['name']
    values laps_reg_keys_values
    recursive v.key?('recursive') ? v['recursive'] : true
    action v.key?('action') ? v['action'].to_sym : :create
  end
end
