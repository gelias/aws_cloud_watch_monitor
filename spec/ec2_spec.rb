require 'rubygems'
require 'rspec'
require '../lib/ec2'

describe "EC2" do
	
	before(:each) do
      @ec2 = double("ec2_factory")
      @vm_mock = double("vm_ec2")
      @instance  = EC2::Instance.new('fake-id')
      @instance_group = EC2::Instance.new
      
  	end

	it "Should start ec2 instance" do
	  @vm_mock.stub(:start, nil)
	  @ec2.stub(:build => @vm_mock)
	  @instance.ec2 = @ec2
	  @instance.start.should be_true
	end

	it "Should stop ec2 instance" do
	  @vm_mock.stub(:stop => nil)
	  @ec2.stub(:build => @vm_mock)
	  @instance.ec2 = @ec2
	  @instance.stop.should be_true
	end

	it "Should raise an error while stopping instance" do
	  @vm_mock.should_receive(:stop).and_raise(Exception.new 'Error')
	  @ec2.stub(:build => @vm_mock)
	  @instance.ec2 = @ec2
	  @instance.stop.should be_false
	end

	it "Should raise an error while starting instance" do
	  @vm_mock.should_receive(:start).and_raise(Exception.new 'Error')
	  @ec2.stub(:build => @vm_mock)
	  @instance.ec2 = @ec2
	  @instance.start.should be_false
	end

	it "Should start all instance mapped on config.yml" do
	  @vm_mock.stub(:start, nil)
	  @ec2.stub(:build => @vm_mock)
	  @instance_group.ec2 = @ec2
	  @instance_group.start_all.should be_true
	end

	it "Should stop all instance mapped on config.yml" do
	  @vm_mock.stub(:stop, nil)
	  @ec2.stub(:build => @vm_mock)
	  @instance_group.ec2 = @ec2
	  @instance_group.stop_all.should be_true
	end

end