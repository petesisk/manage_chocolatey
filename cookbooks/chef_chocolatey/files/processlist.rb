# frozen_string_literal: true

Ohai.plugin :Processlist do
  provides 'processlist'

  collect_data(:windows) do
    processlist Mash.new

    cmd = Mixlib::ShellOut.new('TASKLIST /v /fi "STATUS eq running"')
    cmd.run_command
    processlist = cmd.stdout
  end
end
