ohai_plugin 'chocolist'
ohai_plugin 'processlist'

manage_chocolatey_packages 'magic' do
  installs true
  updates true
  managed_updates true
  safe_updates false
end
