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
