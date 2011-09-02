# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
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
  # dependencies defined in Gemfile
  gem.add_dependency('nokogiri', '= 1.5.0') 
  gem.add_dependency('antlr3', '= 1.8.12') 
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "plympton-refactor #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
