resource_name :manage_chocolatey_packages
provides :manage_chocolatey_packages, :os => 'windows'
default_action :manage
property :installs, [TrueClass, FalseClass], default: true
property :updates, [TrueClass, FalseClass], default: true
property :managed_updates, [TrueClass, FalseClass], default: true
property :safe_updates, [TrueClass, FalseClass], default: true

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
