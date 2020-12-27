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

if node['chef_chocolatey']['private_feed'] == true
  if node['chef_chocolatey'].attribute?('source') && node['chef_chocolatey'].attribute?('source_name')
    chocolatey_source node['chef_chocolatey']['source_name'] do
      source node['chef_chocolatey']['source']
      action :add
    end
  end
end

if node['chef_chocolatey']['disable_public_feed'] == true
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
