require 'rubygems'
require 'rspec'
require '../lib/cloud_watch'

describe "Alarm" do
  it "Should retrieve all alarms" do
    alarm  = CloudWatch::Alarm.new 'AKIAJHLQSOW6PHFQ6MFA', 'Ws2bAjooigvBTSqWjtd1iBMxMHzSp1HAaFJMAPSb' 
    puts alarm.list
  end
end

