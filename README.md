# manage_chocolatey Cookbook

This cookbook installs, manages and configures https://chocolatey.org<br/>
It can be used to install and update software on Windows devices

# Requirements

This cookbook depends on the chocolatey community cookbook to handle installation of chocolatey<br/>
https://github.com/chocolatey-community/chocolatey-cookbook

This cookbook also requires Chef Infra Client version 15.1+<br/>
Although the cookbook could be used with lower versions, the chocolatey_feature resource makes configuring chocolatey much more convenient.

# Attributes

- node['manage_chocolatey']['installs']<br/>
- node['manage_chocolatey']['updates']<br/>
- node['manage_chocolatey']['managed_updates']<br/>
- node['manage_chocolatey']['safe_updates']<br/>
- node['manage_chocolatey']['private_feed']<br/>
- node['manage_chocolatey']['sources']<br/>
- node['manage_chocolatey']['sources']['source_name']<br/>
- node['manage_chocolatey']['sources']['source_url']<br/>
- node['manage_chocolatey']['sources']['admin_only']<br/>
- node['manage_chocolatey']['sources']['allow_self_service']<br/>
- node['manage_chocolatey']['disable_public_feed']<br/>
- node['manage_chocolatey']['enabled_features']<br/>
- node['manage_chocolatey']['disabled_features']<br/>
- node['manage_chocolatey']['config_settings']<br/>
- node['manage_chocolatey']['config_settings']['name']<br/>
- node['manage_chocolatey']['config_settings']['value']<br/>
- node['manage_chocolatey']['ignore_failure']<br/>
- node['manage_chocolatey']['return_codes']<br/>
- node['chocolatey']['sensitive']<br/>
- node['chocolatey']['upgrade']<br/>
- node['chocolatey']['install_vars']<br/>
- node['chocolatey']['install_vars']['chocolateyVersion']

# Usage

Using this template as an example, users should set attributes that suit their own requirements.<br/>
The cookbook also includes yaml files for use in Azure Pipelines or GitHub Actions.<br/>
These services can be used to test and verify the cookbook as it is customised.

In the example provided, this cookbook will do the following :
- Install Chocolatey
- Install the googlechrome package from the public Chocolatey feed
- Update the git package (or install if not already present)
- Update the firefox package, but only if it is already installed
- Update/Install the zoom package (but only if the zoom process is not currently running)
- Enable the 'allowGlobalConfirmation' chocolatey feature
- Disable the 'showDownloadProgress' chocolatey feature
- Set the 'commandExecutionTimeoutSeconds' setting to 14400 seconds

For more detailed information, consult the [wiki](https://github.com/petesisk/manage_chocolatey/wiki)
