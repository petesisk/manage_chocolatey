#
# Cookbook:: chocolatey_packages
# Resource:: manage_chocolatey_packages
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

resource_name :manage_chocolatey_packages
provides :manage_chocolatey_packages, :os => 'windows'
default_action :manage
property :installs, [true, false], default: true
property :updates, [true, false], default: true
property :managed_updates, [true, false], default: true
property :safe_updates, [true, false], default: true

action :manage do
  return unless platform_family?('windows')

  return_codes = node['chocolatey_packages']['return_codes']
  choco_list = shell_out(
    'C:/programdata/chocolatey/bin/clist.exe -lo -r --id-only',
  ).stdout
  process_list = powershell_out(
    '(Get-Process).Name',
  ).stdout

  unless node['chocolatey_packages']['installs'].empty?

    node['chocolatey_packages']['installs'].uniq.each do |name|
      chocolatey_package name do
        action :install
        returns return_codes
        only_if { new_resource.installs }
      end
    end
  end

  unless node['chocolatey_packages']['updates'].empty?

    node['chocolatey_packages']['updates'].uniq.each do |name|
      chocolatey_package name do
        action :upgrade
        returns return_codes
        only_if { new_resource.updates }
      end
    end
  end

  unless node['chocolatey_packages']['managed_updates'].empty?

    node['chocolatey_packages']['managed_updates'].uniq.each do |name|
      chocolatey_package name do
        action :upgrade
        only_if { choco_list.include?(name) }
        returns return_codes
        only_if { new_resource.managed_updates }
      end
    end
  end

  unless node['chocolatey_packages']['safe_updates'].empty?

    node['chocolatey_packages']['safe_updates'].uniq.each do |name, process|
      chocolatey_package name do
        action :upgrade
        not_if { process_list.include?(process) }
        returns return_codes
        only_if { new_resource.safe_updates }
      end
    end
  end
end
