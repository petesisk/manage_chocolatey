#
# Cookbook:: manage_chocolatey
# Recipe:: default
#
# Copyright 2021, Peter Sisk
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# the chocolatey cookbook handles chocolatey installation

include_recipe 'chocolatey'

# this resource manages chocolatey configuration
# see ./resources/manage_chocolatey_configuration.rb

manage_chocolatey_configuration 'magic' do
  enable_features true
  disable_features true
  configure_settings true
  configure_sources true
end

# this resource manages chocolatey packages
# see ./resources/manage_chocolatey_packages.rb

manage_chocolatey_packages 'magic' do
  installs true
  updates true
  managed_updates true
  safe_updates true
  ignore_failure false
end

# this is an example of a package being added to the installs list
# we can do this using any chef conditional
# we can also use this to control packages from other cookbooks

node.default['manage_chocolatey']['installs'] << '7zip'
