# frozen_string_literal: true

Ohai.plugin :processlist do
  provides 'processlist'

  collect_data(:windows) do
    # processlist Mash.new
    # processlist['names'] = []

    cmd = Mixlib::ShellOut.new('TASKLIST /s')
    cmd.run_command
    processlist = cmd.stdout
  end
end
# TASKLIST /v /fi "STATUS eq running"
