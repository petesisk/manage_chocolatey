#
# Cookbook:: chef_chocolatey
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'chocolatey'

ohai_plugin 'choco_list'

log node['choco_list']

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
    only_if { node['choco_list']['packages'].include?(name) } 
    returns [0, 3010]
  end
end
