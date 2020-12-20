node['chef_chocolatey']['enabled_features'].each do |feature|
  chocolatey_feature feature do
    action :enable
  end
end

node['chef_chocolatey']['disabled_features'].each do |feature|
  chocolatey_feature feature do
    action :disable
  end
end
