require 'rubygems'
require 'rspec'
require '../lib/ec2'

describe "EC2" do
	
	before(:each) do
      @instance  = EC2::Instance.new 'i-33ae7942'
      @vm_mock = double("vm_ec2")
  	end

	it "Should start ec2 instance" do
	  @vm_mock.stub(:start => nil)
	  @instance.vm = @vm_mock
	  @instance.start.should be_true
	end

	it "Should stop ec2 instance" do
	  @vm_mock.stub(:stop => nil)
	  @instance.vm = @vm_mock
	  @instance.stop.should be_true
	end

	it "Should raise an error while stopping instance" do
	  @vm_mock.should_receive(:stop).and_raise(Exception.new 'Error')
	  @instance.vm = @vm_mock
	  @instance.stop.should be_false
	end

	it "Should raise an error while starting instance" do
	  @vm_mock.should_receive(:start).and_raise(Exception.new 'Error')
	  @instance.vm = @vm_mock
	  @instance.start.should be_false
	end

end