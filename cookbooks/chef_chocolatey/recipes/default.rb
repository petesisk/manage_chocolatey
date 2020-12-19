#
# Cookbook:: chef_chocolatey
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'chef_chocolatey::install'
include_recipe 'chef_chocolatey::packages'
