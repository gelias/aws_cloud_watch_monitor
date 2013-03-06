require 'rubygems'
require 'rspec'
require 'ec2'

instance_factory = InstanceFactory.new
ec2 = EC2::Instance.new('',instance_factory)
ec2.stop_all
