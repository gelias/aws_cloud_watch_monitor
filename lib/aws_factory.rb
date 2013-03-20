require 'rubygems'
require 'aws-sdk'

module AWSFactory

  class Instance
	
	def instance instance_id
		AWS::EC2::Instance.new instance_id
	end
  end

  class Scaling

	def instance
		AWS::AutoScaling.new
	end
  end
end