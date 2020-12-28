#
# Cookbook:: chocolatey_packages
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'chocolatey_packages::install'
include_recipe 'chocolatey_packages::configure'
include_recipe 'chocolatey_packages::packages'
