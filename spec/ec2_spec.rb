require 'rubygems'
require 'rspec'
require '../lib/ec2'

describe "EC2" do
	
	it "Should start ec2 instance" do
		instance  = EC2::Instance.new 'AKIAJHLQSOW6PHFQ6MFA', 'Ws2bAjooigvBTSqWjtd1iBMxMHzSp1HAaFJMAPSb'
		instance.start.should be_true
	end

	it "Should stop ec2 instance" do
		instance  = EC2::Instance.new 'AKIAJHLQSOW6PHFQ6MFA', 'Ws2bAjooigvBTSqWjtd1iBMxMHzSp1HAaFJMAPSb'
		instance.stop.should be_true
	end
	
end