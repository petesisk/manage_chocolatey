default['chef_chocolatey'] = {
  'installs' => [
    'googlechrome'
  ],
  'updates' => [
    'vlc'
  ],
  'managed_updates' => [
    'git'
  ],
  'source' => '',
  'source_name' => '',
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
    # Business Version features from here ---->>
    'virusCheck',
    'downloadCache',
    'allowSynchronization'
  ],
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
  ],
  'gui_features' => [
    'DefaultToTileViewForLocalSource',
    'DefaultToTileViewForRemoteSource',
    'UseDelayedSearch',
    'ExcludeInstalledPackages',
    'ShowAggregatedSourceView'
  ]
}
default['chocolatey'] = {
  'sensitive' => true,
  'upgrade' => false
}
