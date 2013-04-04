require 'spec_helper'

describe 'Auto Scale' do 

  before(:each) do
  	@as_factory = double("Auto_Scaling_Factory")
  	@as_instance = double("Auto_Scaling_Instance")
  	@as_configCollection = double("Auto_Scalling_Lanuch_Configuration_Collection")
  	@as_config = double("Launch_Configuration")
  	@as_groupCollection = double("Auto_Scalling_Group_Collection")
  	@as_group = double("Auto_Scalling_Group")

  	@as_factory.stub(:instance).and_return(@as_instance)
  end

  it 'Create Auto Scaling Configuration' do 
  	@as_instance.stub(:launch_configurations).and_return(@as_configCollection)
  	@as_configCollection.stub(:create).and_return(@as_config)
  	@as_config.stub(:name).and_return('launch-config-spikeday')
  	auto_scale = EC2::Scaling.new(@as_factory)
  	auto_scale.launch_config('launch-config-spikeday', 'ami-58f76f31', 't1.micro').should be_true
  end

  it 'Create Auto Scaling Group' do 
  	@as_instance.stub(:groups).and_return(@as_groupCollection)
  	@as_groupCollection.stub(:create).and_return(@as_group)
  	@as_group.stub(:max_size).and_return(2)
  	@as_group.stub(:min_size).and_return(1)
  	auto_scale = EC2::Scaling.new(@as_factory)
  	auto_scale.add_group('group_name','us-east-1a', 'elb_name', 1, 2).should be_true
  	auto_scale.group.max_size == 2
  	auto_scale.group.min_size == 1
  end

end