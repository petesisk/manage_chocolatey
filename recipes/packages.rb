ohai_plugin 'chocolist'
ohai_plugin 'processlist'

# node['chocolatey_packages']['installs'].each do |name|
#   chocolatey_package name do
#     action :install
#     returns [0, 3010]
#   end
# end

# node['chocolatey_packages']['updates'].each do |name|
#   chocolatey_package name do
#     action :upgrade
#     returns [0, 3010]
#   end
# end

manage_chocolatey_packages

node['chocolatey_packages']['managed_updates'].each do |name|
  chocolatey_package name do
    action :upgrade
    only_if { node['chocolist']['packages'].include?(name) }
    returns [0, 3010]
  end
end

node['chocolatey_packages']['safe_updates'].each do |name, process|
  chocolatey_package name do
    action :upgrade
    not_if { node['processlist']['names'].include?(process) }
    returns [0, 3010]
  end
end
