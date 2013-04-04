require 'rubygems'
require 'aws-sdk'
require 'yaml'

module Security
  
  def self.credentials
    config = begin
        YAML.load_file(File.join(File.dirname(__FILE__), 'config.yml'))
        #YAML.load(File.open("../config.yml"))
      rescue Exception => e
        puts  "Could not load config: #{e.message}"
      end
      config
  end

  def self.instances_to_start
	  credentials["instances_to_start"]
  end

  def self.instances_to_stop
    credentials["instances_to_stop"]
  end
  
end