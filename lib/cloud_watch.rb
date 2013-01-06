require 'rubygems'
require 'aws-sdk'

module CloudWatch
  class Alarm

    def initialize access_key, secret_key
      @cw = AWS::CloudWatch.new(:access_key_id => access_key,:secret_access_key => secret_key)
    end

    def list
      resp = @cw.client.describe_alarms
      resp[:metric_alarms]
      #resp[:metric_alarms].each do |alarm|
      #{}"#{alarm[:alarm_name]} : #{alarm[:state_value]}".to_s
      #end
    end

  end
end 

module EC2 
  class Instance
    def initialize access_key, secret_key
      AWS.config(:access_key_id => access_key,:secret_access_key => secret_key)
      @instance = AWS::EC2::Instance.new('i-33ae7942')
    end

    def start
      @instance.start
    end
  end
end
