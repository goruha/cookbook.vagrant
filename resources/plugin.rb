actions :install, :uninstall
default_action :install

attribute :name, :kind_of => String, :name_attribute => true
attribute :version, :kind_of => String
attribute :source, :kind_of => String
attribute :user, :kind_of => String
