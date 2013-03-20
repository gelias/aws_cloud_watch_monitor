require 'rubygems'
require 'aws-sdk'
require 'security'
require 'instance_factory'
require 'aws_factory'

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
      Security.instances_to_start.each do |instance_id|
        @instance_id = instance_id
        start
      end
      true
    end

    def stop_all
      Security.instances_to_stop.each do |instance_id|
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

  class Scaling

    attr_accessor :credentials, :auto_scaling_factory, :config, :group
    
    def initialize(auto_scaling_factory = nil)
      @credentials = Security.credentials
      AWS.config(:access_key_id => credentials["access_key"],:secret_access_key => credentials["secret_access"])
      @auto_scaling_factory = auto_scaling_factory
    end

    def launch_config(config_name, ami_name, instance_type)
      @config = @auto_scaling_factory.instance.launch_configurations.create(config_name, ami_name, instance_type)
    end

    def add_group(group_name, availability_zone, elb, max_size, min_size)
      @group = @auto_scaling_factory.instance.groups.create(
        group_name,
        :launch_configuration => @config,
        :load_balancer_names => %w(elb),
        :availability_zones => %w(availability_zone),
        :min_size => min_size,
        :max_size => max_size)
    end

  end

end
