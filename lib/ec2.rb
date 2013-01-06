require 'rubygems'
require 'aws-sdk'
require 'security'

module EC2 

  class Instance

    def initialize
      credentials = Security.credentials
      AWS.config(:access_key_id => credentials["access_key"],:secret_access_key => credentials["secret_access"])
      @instance = AWS::EC2::Instance.new('i-33ae7942')
    end

    def start
      begin
        @instance.start
        true
      rescue
        false
        end
    end

    def stop
      begin
        @instance.stop
        true
      rescue
        false
      end
    end

  end

end