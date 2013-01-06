require 'rubygems'
require 'rspec'
require '../lib/cloud_watch'

describe "Alarm" do
  it "Should retrieve all alarms" do
    alarm  = CloudWatch::Alarm.new 'access_key', 'secret_key'
    alarms = alarm.list
    alarms.length.should > 0
  end
end

describe "EC2" do
	it "Should stop ec2 instance" do
		instance  = EC2::Instance.new 'access_key', 'secret_key'
		instance.stop
	end

	it "Should stop ec2 instance" do
		instance  = EC2::Instance.new 'access_key', 'secret_key'
		instance.start
	end

end

