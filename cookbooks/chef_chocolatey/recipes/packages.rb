ohai_plugin 'chocolist'
ohai_plugin 'processlist'

node['chef_chocolatey']['installs'].each do |name|
  chocolatey_package name do
    action :install
    returns [0, 3010]
  end
end

node['chef_chocolatey']['updates'].each do |name|
  chocolatey_package name do
    action :upgrade
    returns [0, 3010]
  end
end

node['chef_chocolatey']['managed_updates'].each do |name|
  chocolatey_package name do
    action :upgrade
    only_if { node['chocolist']['packages'].include?(name) }
    returns [0, 3010]
  end
end

node['chef_chocolatey']['safe_updates'].each do |name, process|
  chocolatey_package name do
    action :upgrade
    not_if { node['processlist']['names'].include?(process) }
    returns [0, 3010]
  end
end
