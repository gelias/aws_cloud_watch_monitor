require 'spec_helper'

describe "EC2" do

  it "should load credentials from YAML config" do
  	credentials = Security.credentials
  	credentials["access_key"].should_not be_nil
  	credentials["secret_access"].should_not be_nil
  end

  it "Should load instance ids to start" do
  	instances_to_start = Security.instances_to_start
    instances_to_start.first.should eq('fake-id-a')
  end

    it "Should load instance ids to stop" do
    instances_to_stop = Security.instances_to_stop
    instances_to_stop.first.should eq('fake-id-x')
  end
  
end
