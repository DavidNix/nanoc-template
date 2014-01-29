require 'rake/testtask'
require 'dotenv/tasks'

Rake::TestTask.new do |t|
	t.pattern = "spec/*_spec.rb"
end

desc "uploads site to s3"
task :upload => :dotenv do
	ENV['ENVIRONMENT'] = 'production'
	puts %x{nanoc compile}
end
