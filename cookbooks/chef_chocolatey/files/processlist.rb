# frozen_string_literal: true

Ohai.plugin :processlist do
  provides 'processlist'

  collect_data(:windows) do
    processlist Mash.new
    processlist['names'] = []

    cmd = Mixlib::ShellOut.new('dir')
    cmd.run_command
    processlist['names'] = cmd.stdout.split("\r\n")
  end
end
