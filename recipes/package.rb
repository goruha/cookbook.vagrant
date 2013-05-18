remote_file "#{Chef::Config[:file_cache_path]}/#{node['vagrant']['package']}" do
  action :create
  source "#{node['vagrant']['download_site']}/#{node['vagrant']['version_hash']}/#{node['vagrant']['package']}"
  not_if { node['vagrant']['version'] == node['vagrant']['installed_version'] }
  notifies :create, "ruby_block[set_installed_version]"
end

ruby_block "set_installed_version" do
  block do
    node.set['vagrant']['installed_version'] = node['vagrant']['version']
  end
  action :nothing 
end

package node['vagrant']['package'] do
  action :install
  case node['platform_family']
  when "debian"
    provider Chef::Provider::Package::Dpkg
  end
  source "#{Chef::Config[:file_cache_path]}/#{node['vagrant']['package']}"
end 
