require 'rubygems'
require 'rspec'
require '../lib/security'

describe "EC2" do

  it "should load credentials from YAML config" do
  	credentials = Security.credentials
  	credentials["access_key"].should_not be_nil
  	credentials["secret_access"].should_not be_nil
  end

  it "Should load instance ids" do
  	instances = Security.instances
  	puts instances
  	instances.length.should == 2
  end
  
end