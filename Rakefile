require 'rubygems'
#require 'rcov'
require 'rspec/core'
require 'rspec/core/rake_task'

namespace :test do
	#RSpec::Core::RakeTask.new(:coverage) do |t|
	#	t.rcov = true
	#	t.rcov_opts =  %q[--exclude "spec"]
	#	t.verbose = true
	#end
	
	RSpec::Core::RakeTask.new do |t|
		t.rspec_opts = %w{--colour --format progress}
		t.pattern = "spec/**/*_spec.rb"
	end
end