vagrant_plugin "vagrant-berkshelf" do
  action :install
end

vagrant_plugin "vagrant-berkshelf" do
  action :uninstall
end

vagrant_plugin "vagrant-berkshelf" do
  action :install
  version "1.3.0"
end
