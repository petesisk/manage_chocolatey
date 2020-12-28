default['chocolatey_packages'] = {
  # installs is a list of packages that will be installed (but not updated)
  'installs' => [
    'putty'
  ],
  # updates is a list of packages that will be installed AND updated
  'updates' => [
    'vlc'
  ],
  # managed_updates are packages that will be updated only if already installed
  'managed_updates' => [
    'git'
  ],
  # safe_updates are only updated if the specified process is not running
  # this prevents updates that would cause an application to quit during use
  # the format to use is 'package', 'process'
  'safe_updates' => [
    [
      'zoom', 'zoom'
    ],
  ],
  # configures a private chocolatey repo
  # if these settings are not provided, the public chocolatey feed is used
  # we can also disable the public chocolatey feed
  'private_feed' => false,
  'disable_public_feed' => false,
  'source' => '',
  'source_name' => '',
  # a list of chocolatey features that are set to enabled
  # https://docs.chocolatey.org/en-us/configuration
  'enabled_features' => [
    'checksumFiles',
    'autoUninstaller',
    'allowGlobalConfirmation',
    'powershellHost',
    'ignoreInvalidOptionsSwitches',
    'showNonElevatedWarnings',
    'removePackageInformationOnUninstall',
    'logValidationResultsOnWarnings',
    'usePackageRepositoryOptimizations',
    'usePackageExitCodes',
  ],
  # a list of chocolatey features that are set to disabled
  'disabled_features' => [
    'exitOnRebootDetected',
    'failOnAutoUninstaller',
    'failOnStandardError',
    'allowEmptyChecksums',
    'allowEmptyChecksumsSecure',
    'logEnvironmentValues',
    'failOnInvalidOrMissingLicense',
    'useFipsCompliantChecksums',
    'showDownloadProgress',
    'stopOnFirstPackageFailure',
    'useRememberedArgumentsForUpgrades',
    'ignoreUnfoundPackagesOnUpgradeOutdated',
    'skipPackageUpgradesWhenNotInstalled',
    'logWithoutColor',
    'scriptsCheckLastExitCode'
  ]
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
