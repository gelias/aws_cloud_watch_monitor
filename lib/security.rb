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

  class Credential
    
    attr_accessor :access_key, :secret_access
    
    def initialize
      config = begin
        YAML.load(File.open("../config.yml"))
      rescue Exception => e
        puts  "Could not load config: #{e.message}"
      end
      @access_key = config["access_key"]
      @secret_access = config["secret_access"]
    end
  end
  
end