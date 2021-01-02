#
# Cookbook:: manage_chocolatey
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
provides :manage_chocolatey_configuration, os: 'windows'
default_action :manage
property :enable_features, [true, false], default: true
property :disable_features, [true, false], default: true
property :configure_settings, [true, false], default: true
property :configure_sources, [true, false], default: true

action :manage do
  return unless platform_family?('windows')

  unless node['manage_chocolatey']['enabled_features'].empty?

    node['manage_chocolatey']['enabled_features'].each do |feature|
      chocolatey_feature feature do
        action :enable
        only_if { new_resource.enable_features }
      end
    end
  end

  unless node['manage_chocolatey']['disabled_features'].empty?

    node['manage_chocolatey']['disabled_features'].each do |feature|
      chocolatey_feature feature do
        action :disable
        only_if { new_resource.disable_features }
      end
    end
  end

  unless node['manage_chocolatey']['config_settings'].empty?

    node['manage_chocolatey']['config_settings'].each do |config|
      chocolatey_config config['name'] do
        value config['value']
        action :set
        only_if { new_resource.configure_settings }
      end
    end
  end

  if node['manage_chocolatey']['private_feed'] == true
    node['manage_chocolatey']['sources'].each do |source|
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

  source_action =
    if node['manage_chocolatey']['disable_public_feed'] == true
      :disable
    else
      :enable
    end

  chocolatey_source 'chocolatey' do
    source 'https://chocolatey.org/api/v2/'
    action source_action
    only_if { node['manage_chocolatey']['disable_public_feed'] }
    only_if { new_resource.configure_sources }
  end
end
