require 'rubygems'
require 'rspec'
require '../lib/cloud_watch'

describe "Alarm" do
  
  it "Should create a new CloudWatch instance with credentials" do
    alarm  = CloudWatch::Alarm.new
    alarm.access_key.should_not be_nil
    alarm.secret_access.should_not be_nil
  end

  it "Should retrieve all alarms" do
  	#stub aws call
    client = double("client")
    client.stub(:describe_alarms => {:metric_alarms=>[{:name=>"valor",:valor=>"valuesss"}]} )
    cloud_watch = double("cw")
    cloud_watch.stub(:client => client)
    
    alarm  = CloudWatch::Alarm.new
    alarm.cw = cloud_watch
    alarm.list.length.should eq(1)
  end

end
