#
# Cookbook:: chef_chocolatey
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'chocolatey'

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
