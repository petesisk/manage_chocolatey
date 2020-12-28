name 'chocolatey_packages'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs and Configures chocolatey and chocolatey packages'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'
chef_version '>= 15.0'
issues_url 'https://github.com/petesisk/chocolatey_packages/issues'
source_url 'https://github.com/petesisk/chocolatey_packages'

depends 'chocolatey'
depends 'ohai'
