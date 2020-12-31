#
# Cookbook:: chocolatey_packages
# Resource:: manage_chocolatey_configuration
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

resource_name :manage_chocolatey_configuration
provides :manage_chocolatey_configuration, :os => 'windows'
default_action :manage
property :enable_features, [true, false], default: true
property :disable_features, [true, false], default: true
property :configure_settings, [true, false], default: true
property :configure_sources, [true, false], default: true

action :manage do
  return unless platform_family?('windows')

  unless node['chocolatey_packages']['enabled_features'].empty?

    node['chocolatey_packages']['enabled_features'].each do |feature|
      chocolatey_feature feature do
        action :enable
        only_if { new_resource.enable_features }
      end
    end
  end

  unless node['chocolatey_packages']['disabled_features'].empty?

    node['chocolatey_packages']['disabled_features'].each do |feature|
      chocolatey_feature feature do
        action :disable
        only_if { new_resource.disable_features }
      end
    end
  end

  unless node['chocolatey_packages']['config_settings'].empty?

    node['chocolatey_packages']['config_settings'].each do |config|
      chocolatey_config config['name'] do
        value config['value']
        action :set
        only_if { new_resource.configure_settings }
      end
    end
  end

  if node['chocolatey_packages']['private_feed'] == true
    node['chocolatey_packages']['sources'].each do |source|
      chocolatey_source source['source_name'] do
        source source['source_url']
        admin_only source['admin_only'] if !source['admin_only'].nil?
        allow_self_service source['allow_self_service'] if !source['allow_self_service'].nil?
        bypass_proxy source['bypass_proxy'] if !source['bypass_proxy'].nil?
        priority source['priority'] if !source['priority'].nil?
        action :add
        only_if { new_resource.configure_sources }
      end
    end
  end

  chocolatey_source 'chocolatey' do
    source 'https://chocolatey.org/api/v2/'
    action :disable
    only_if { node['chocolatey_packages']['disable_public_feed'] }
    only_if { new_resource.configure_sources }
  end
end
