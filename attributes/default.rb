default['vagrant']['version'] = "1.1.5"
default['vagrant']['version_hash'] = "64e360814c3ad960d810456add977fd4c7d47ce6"
default['vagrant']['plugins'] = {}
default['vagrant']['boxes'] = {}
default['vagrant']['download_site'] = "http://files.vagrantup.com/packages"
default['vagrant']['installed_version'] = nil

case node['os']
when "linux"
  default['vagrant']['package'] = "vagrant_#{node['languages']['ruby']['host_cpu']}"
  case node['platform_family']
  when "debian" 
    default['vagrant']['package'] << ".deb"
  when "rhel"
    default['vagrant']['package'] << ".rpm"
  end
when "darwin"
  default['vagrant']['package'] = "Vagrant.dmg"
when "windows", "WINNT"
  default['vagrant']['package'] = "Vagrant.msi"
else
  Chef::Log.error("Platform not supported by cookbook at this time.")
end
