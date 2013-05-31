vagrant_box "lucid-32" do
  url "http://files.vagrantup.com/lucid32.box"
  action :install
end

vagrant_plugin "lucid-32" do
  action :uninstall
end
