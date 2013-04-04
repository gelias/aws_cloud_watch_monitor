require 'rubygems'
require 'rspec'

#require all files of lib directory
Dir[File.join(File.dirname(__FILE__), '../lib', '**/*.rb')].each {|file| require file }