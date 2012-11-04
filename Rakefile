# encoding: utf-8

#require 'rubygems'
#require 'bundler'
#begin
#  Bundler.setup(:default, :development)
#rescue Bundler::BundlerError => e
#  $stderr.puts e.message
#  $stderr.puts "Run `bundle install` to install missing gems"
#  exit e.status_code
#end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "plympton-refactor"
  gem.homepage = "http://github.com/rogwfu/plympton-refactor"
  gem.license = "MIT"
  gem.summary = %Q{Reads a YAML dump of a program's disassembly from IDA Pro}
  gem.description = %Q{A Gem to read program disassembly from a YAML dump.  The YAML dump is generated from an ida pro python script.  This script is included along with this Gem (func.py)}
  gem.email = "roger.seagle@gmail.com"
  gem.authors = ["Roger Seagle"]
  gem.required_ruby_version = '>= 1.9.3'
  # dependencies defined in Gemfile
  gem.add_dependency('nokogiri', '= 1.5.0') 
  gem.add_dependency('antlr3', '= 1.8.12') 
  gem.add_dependency('narray', '>= 0.5.9')
  gem.add_dependency('bigdecimal', '>=1.1.0')

  gem.add_development_dependency('jeweler', '>=1.8.4')
  gem.add_development_dependency('rspec', '>=2.11.0')
  gem.add_development_dependency('yard', '>=0.8.3')

end


Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'

# Define a rspec testing task for the function solver
RSpec::Core::RakeTask.new("spec:func") do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

# Define a set of rspec tests for lldb tracing
RSpec::Core::RakeTask.new("spec:lldb") do |spec|
    spec.pattern = 'spec/**/*_lldb.rb' 
    spec.rspec_opts = ['--backtrace']
end

# Define a rspec testing task for rcov
RSpec::Core::RakeTask.new("spec:rcov") do |spec|
  spec.pattern = 'spec/**/*_rcov.rb'
  spec.rcov = true
end

task :default => "spec:lldb"

#require 'rake/rdoctask'
require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "plympton-refactor #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# Rake Task for building yard doc
require 'yard'
YARD::Rake::YardocTask.new do |t|
	t.options = ['--exclude', 'bin/*']
end
