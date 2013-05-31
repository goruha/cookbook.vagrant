actions :add, :remove
default_action  :add

attribute :name, :kind_of => String, :name_attribute => true
attribute :url, :kind_of => String, :required => true
attribute :provider, :kind_of => String
