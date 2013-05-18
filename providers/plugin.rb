require 'mixlib/shellout'

action :install do
  if vagrant_plugin_installed?
    new_resource.updated_by_last_action(false)
  else
    command = "vagrant plugin install #{new_resource.name}"
    
    if !new_resource.version.nil?
      command << " --plugin-version #{new_resource.version}"
    end

    if Mixlib::ShellOut.new(command, :user => new_resource.user || "root").run_command.exitstatus
      new_resource.updated_by_last_action(false)     
    else
      new_resource.updated_by_last_action(true)
    end
  end  
end

action :uninstall do
  if vagrant_plugin_installed? 
    if Mixlib::ShellOut.new("vagrant plugin uninstall #{new_resource.name}", :user => new_resource.user || "root").run_command.exitstatus
      new_resource.updated_by_last_action(false)
    else
      new_resource.updated_by_last_action(true)
    end
  else
    new_resource.updated_by_last_action(false)
  end
end

def vagrant_plugins
  vagrant_user = new_resource.user || "root"
  plugins = Mixlib::ShellOut.new("vagrant plugin list", :user => vagrant_user).run_command
  if plugins.stdout.match("No plugins installed.")
    {} 
  else
    Hash[*plugins.stdout.split("\n").map {|p| p.split(" ")}.flatten] || {}
  end
end

def vagrant_plugin_installed?
  if new_resource.version.nil?
    vagrant_plugins.has_key?(new_resource.name)
  else
    vagrant_plugins.has_key?(new_resource.name) && vagrant_plugins[new_resource.nam].match(new_resource.version)
  end
end
