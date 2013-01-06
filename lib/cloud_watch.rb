require 'rubygems'
require 'aws-sdk'
require 'yaml'
require 'security'

module CloudWatch

  class Alarm

  	attr_accessor :cw

    def initialize
      credentials = Security.credentials
      @cw = AWS::CloudWatch.new(:access_key_id => credentials["access_key"],:secret_access_key => credentials["secret_access"])
    end

    def list
      resp = @cw.client.describe_alarms
      resp[:metric_alarms]
    end
  
  end

end