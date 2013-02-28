require 'rubygems'
require 'rspec'
require 'ec2'

ec2_instance = EC2::Instance.new 'i-52d02f21'
ec2_instance.start
