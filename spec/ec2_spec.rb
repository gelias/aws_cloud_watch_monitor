require 'rubygems'
require 'rspec'
require '../lib/ec2'

describe "EC2" do
	
	it "Should start ec2 instance" do
		instance  = EC2::Instance.new
		instance.start.should be_true
	end

	it "Should stop ec2 instance" do
		instance  = EC2::Instance.new
		instance.stop.should be_true
	end
	
end