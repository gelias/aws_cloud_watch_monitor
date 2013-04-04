
require 'spec_helper'

describe "Alarm" do
  
  it "Should retrieve all alarms" do
  	#stub aws call cloud_watch service
    client = double("client")
    client.stub(:describe_alarms => {:metric_alarms=>[{:name=>"valor",:valor=>"valuesss"}]} )
    cloud_watch = double("cw")
    cloud_watch.stub(:client => client)
    
    alarm  = CloudWatch::Alarm.new
    alarm.cw = cloud_watch
    alarm.list.length.should eq(1)
  end

end
