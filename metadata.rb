name 'manage_chocolatey'
maintainer 'Peter Sisk'
maintainer_email 'peter.sisk@gmail.com'
license 'All Rights Reserved'
description 'Installs and Configures chocolatey and chocolatey packages'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'
chef_version '>= 15.0'
issues_url 'https://github.com/petesisk/manage_chocolatey/issues'
source_url 'https://github.com/petesisk/manage_chocolatey'

depends 'chocolatey'
