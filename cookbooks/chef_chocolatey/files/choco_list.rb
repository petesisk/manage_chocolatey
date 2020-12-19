# frozen_string_literal: true

Ohai.plugin :Choco_list do
  provides 'choco_list'

  collect_data(:windows) do
    choco_list Mash.new
    choco_list['packages'] = []
    cmd = Mixlib::ShellOut.new('clist -lo -r --id-only')
    cmd.run_command
    choco_list['packages'] = cmd.stdout.split("\r\n")
  end
end
