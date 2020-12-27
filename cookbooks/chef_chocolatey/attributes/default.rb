default['chef_chocolatey'] = {
  'installs' => [
    'putty'
  ],
  'updates' => [
    'vlc'
  ],
  'managed_updates' => [
    'git'
  ],
  'safe_updates' => [
    [
      'googlechrome', 'lolpants_process',
      'firefox', 'firefox_process'
    ],
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
  'upgrade' => false,
  'install_vars' => {
    'chocolateyVersion' => '0.10.5'
  }
}
