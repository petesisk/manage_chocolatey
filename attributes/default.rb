#
# Cookbook:: manage_chocolatey
# Attributes:: default
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

default['manage_chocolatey'] = {
  # installs is a list of packages that will be installed (but not updated)
  'installs' => [
    'googlechrome'
  ],
  # updates is a list of packages that will be installed AND updated
  'updates' => [
    'git'
  ],
  # managed_updates are packages that will be updated only if already installed
  'managed_updates' => [
    'firefox'
  ],
  # safe_updates are only updated if the specified process is not running
  # this prevents updates that would fail or cause an app to quit during use
  'safe_updates' => [
    {
      'package_name' => 'zoom',
      'process_name' => 'zoom'
    },
  ],
  # configures a private chocolatey repo
  # if these settings are not provided, the public chocolatey feed is used
  # we can also disable the public chocolatey feed
  'private_feed' => false,
  'sources' => [
    {
      'source_name' => '',
      'source_url' => '',
      'admin_only' => false,
      'allow_self_service' => false
    },
  ],
  # when using a private repo, you may wish to disable the public feed
  'disable_public_feed' => false,
  # a list of chocolatey features that are set to enabled
  # https://docs.chocolatey.org/en-us/configuration
  'enabled_features' => [
    'allowGlobalConfirmation',
  ],
  # a list of chocolatey features that are set to disabled
  'disabled_features' => [
    'showDownloadProgress',
  ],
  # chocolatey config settings
  'config_settings' => [
    {
      'name' => 'commandExecutionTimeoutSeconds',
      'value' => '14400'
    },
  ],
  # chef will ignore any package failures and move on to the next
  # without this setting, a failing package would end the chef run
  'ignore_failure' => false,
  # set the allowed exit codes for packages
  # without this setting, a 3010 exit code would fail the chef run
  'return_codes' => [0, 3010]
}

# attributes that configure the chocolatey community cookbook
# https://github.com/chocolatey-community/chocolatey-cookbook
default['chocolatey'] = {
  'sensitive' => true,
  'upgrade' => false,
  'install_vars' => {
    'chocolateyVersion' => '0.10.5'
  }
}
