# frozen_string_literal: true

Ohai.plugin :Processlist do
  provides 'processlist'

  collect_data(:windows) do
    processlist Mash.new
    processlist['names'] = []

    cmd = Mixlib::ShellOut.new('powershell.exe -NoLogo -NonInteractive -NoProfile -Command "(get-process).Name"')
    cmd.run_command
    processlist['names'] = cmd.stdout.split("\r\n")
    processlist['names'] = processlist['names'].uniq
  end
end
