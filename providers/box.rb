require 'mixlib/shellout'

action :add do
  if box_exist?
    new_resource.updated_by_last_action(false)
  else
    command = "vagrant box add #{new_resource.name} #{new_resource.url}"
    command << " --provider #{new_resource.provider}" if not new_resource.provider.nil?

    if Mixlib::ShellOut.new(command, :user => new_resource.user || "root").run_command.exitstatus
      new_resource.updated_by_last_action(false)
    else
      new_resource.updated_by_last_action(true)  
    end
  end
end

action :remove do
  # TODO: Implement
end

def box_exist?
  box_list.has_key? new_resource.name
end

def box_list
  vagrant_user = new_resource.user || "root"
  boxes = Mixlib::ShellOut.new("vagrant box list", :user => vagrant_user).run_command
  if boxes.stdout.match("There are no installed boxes! Use `vagrant box add` to add some.")
    {} 
  else
    Hash[*boxes.stdout.split("\n").map {|b| box.split(" ")}.flatten]
  end
end
