require 'rubygems'
require 'aws-sdk'

class InstanceFactory

	def build instance_id
		AWS::EC2::Instance.new instance_id
	end
end