default['chef_chocolatey'] = {
  'installs' => [
    'googlechrome'
  ],
  'updates' => [
    'vlc'
  ],
  'managed_updates' => [
    'git'
  ]
}
default['chocolatey'] = {
  'sensitive' => true
}
