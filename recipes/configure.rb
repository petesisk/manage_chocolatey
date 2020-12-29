#
# Cookbook:: chocolatey_packages
# Recipe:: configure
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

node['chocolatey_packages']['enabled_features'].each do |feature|
  chocolatey_feature feature do
    action :enable
  end
end

node['chocolatey_packages']['disabled_features'].each do |feature|
  chocolatey_feature feature do
    action :disable
  end
end

if node['chocolatey_packages']['private_feed'] == true
  if !node['chocolatey_packages']['source'].empty? && !node['chocolatey_packages']['source_name'].empty?
    chocolatey_source node['chocolatey_packages']['source_name'] do
      source node['chocolatey_packages']['source']
      action :add
    end
  end
end

if node['chocolatey_packages']['disable_public_feed'] == true
  chocolatey_source 'chocolatey' do
    source 'https://chocolatey.org/api/v2/'
    action :disable
  end
else
  chocolatey_source 'chocolatey' do
    source 'https://chocolatey.org/api/v2/'
    action :enable
  end
end
