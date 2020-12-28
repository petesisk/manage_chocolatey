# frozen_string_literal: true

Ohai.plugin :ChocoList do
  provides 'chocolist'

  collect_data(:windows) do
    chocolist Mash.new
    chocolist['packages'] = []

    cmd = Mixlib::ShellOut.new('C:/programdata/chocolatey/bin/clist.exe -lo -r --id-only')
    cmd.run_command
    chocolist['packages'] = cmd.stdout.split("\r\n")
  end
end
