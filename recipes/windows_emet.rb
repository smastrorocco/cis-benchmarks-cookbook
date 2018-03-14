#
# Cookbook:: cis-benchmarks
# Recipe:: windows_emet
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

# Install EMET
windows_package node['cis-benchmarks']['windows']['emet']['package']['name'] do
  source node['cis-benchmarks']['windows']['emet']['package']['source']
  checksum node['cis-benchmarks']['windows']['emet']['package']['checksum']
  options '/quiet'
  installer_type :msi
end

# Apply EMET registry settings
emet_reg_keys = node['cis-benchmarks']['windows']['emet']['registry_keys']

emet_reg_keys.each do |k, v|
  next if v.to_s.empty?

  # Build array of values and ensure type value is symbol
  emet_reg_keys_values = []
  [v['values']].flatten(1).each do |value|
    emet_reg_keys_values.push(name: value['name'], type: value['type'].to_sym, data: value['data'])
  end

  registry_key "CIS #{k}" do
    key v['name']
    recursive v.key?('recursive') ? v['recursive'] : true
    action v.key?('action') ? v['action'].to_sym : :create
  end
end
