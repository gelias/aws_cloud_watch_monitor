require 'rubygems'
require 'aws-sdk'

module CloudWatch
  class Alarm

    def initialize access_key, secret_key
      @cw = AWS::CloudWatch.new(:access_key_id => access_key,:secret_access_key => secret_key)
    end

    def list
      resp = @cw.client.describe_alarms
      resp[:metric_alarms].each do |alarm|
      "#{alarm[:alarm_name]} : #{alarm[:state_value]}".to_s
      end
    end

  end
end 
