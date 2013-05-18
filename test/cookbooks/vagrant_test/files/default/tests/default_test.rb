require File.expand_path('../helpers.rb', __FILE__)

describe_recipe "vagrant_test::default" do
  include Helpers::VagrantTest
  
  it 'installs the vagrant package' do
    package("vagrant").must_be_installed
  end
end
