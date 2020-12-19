#
# Cookbook:: chef_chocolatey
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'chocolatey'

ohai_plugin 'chocolist'

log node['chocolist']

node['chef_chocolatey']['installs'].each do |name|
  chocolatey_package name do
    action :install
    returns [0, 3010]
  end
end

node['chef_chocolatey']['updates'].each do |name|
  chocolatey_package name do
    action :install
    returns [0, 3010]
  end
end

node['chef_chocolatey']['managed_updates'].each do |name|
  chocolatey_package name do
    action :install
    only_if { node['chocolist']['packages'].include?(name) } 
    returns [0, 3010]
  end
end
