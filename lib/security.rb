require 'rubygems'
require 'aws-sdk'
require 'yaml'

module Security
  
  def self.credentials
    config = begin
        YAML.load(File.open("../config.yml"))
      rescue Exception => e
        puts  "Could not load config: #{e.message}"
      end
      config
  end

  def self.instances
	  credentials["instances"]
  end
  
end