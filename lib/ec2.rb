require 'rubygems'
require 'aws-sdk'
require 'security'

module EC2 

  class Instance

    attr_accessor :vm

    def initialize instance_id
      credentials = Security.credentials
      AWS.config(:access_key_id => credentials["access_key"],:secret_access_key => credentials["secret_access"])
      @vm = AWS::EC2::Instance.new(instance_id)
    end

    def start
      begin
        @vm.start
        true
      rescue Exception => e
        puts "Could not start instance: #{e.message}"
        false
        end
    end

    def stop
      begin
        @vm.stop
        true
      rescue Exception => e
        puts "Could not stop instance: #{e.message}"
        false
      end
    end

  end

end