require 'rubygems'
require 'aws-sdk'
require 'yaml'
require 'security'

module CloudWatch

  class Alarm < Security::Credential

  	attr_accessor :cw

    def initialize
      super
      @cw = AWS::CloudWatch.new(:access_key_id => access_key,:secret_access_key => secret_access)
    end

    def list
      resp = @cw.client.describe_alarms
      resp[:metric_alarms]
    end
  
  end

end