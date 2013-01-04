require 'rubygems'
require 'rspec'
require '../lib/cloud_watch'

describe "Alarm" do
  it "Should retrieve all alarms" do
    alarm  = CloudWatch::Alarm.new '', ''
    puts alarm.list
  end
end

