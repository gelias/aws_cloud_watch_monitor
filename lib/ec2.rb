require 'rubygems'
require 'aws-sdk'
require 'security'

module EC2 

  class Instance

    attr_accessor :vm, :ec2


    def initialize(instance_id = '', instance_factory = nil)
      credentials = Security.credentials
      AWS.config(:access_key_id => credentials["access_key"],:secret_access_key => credentials["secret_access"])
      @ec2 = instance_factory
      @instance_id = instance_id
    end

    def start
      begin
        puts "starting instance #{@instance_id}"
        @ec2.build(@instance_id).start
        true
      rescue Exception => e
        puts "Could not start instance: #{e.message}"
        false
      end
    end

    def start_all
      Security.instances.each do |instance_id|
        @instance_id = instance_id
        start
      end
      true
    end

    def stop_all
      Security.instances.each do |instance_id|
        @instance_id = instance_id
        stop
      end
      true
    end

    def stop
      begin
        puts "stoping instance #{@instance_id}"
        @ec2.build(@instance_id).stop
        true
      rescue Exception => e
        puts "Could not stop instance: #{e.message}"
        false
      end
    end

  end

end
