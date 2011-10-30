require 'yaml'
require 'bigdecimal'
require 'nokogiri'
#$: << "/Users/rseagle/.rvm/gems/ruby-1.9.2-head/gems/narray-0.6.0.1" 
require 'narray'

Dir[File.dirname(__FILE__) + "/plympton/*.rb"].each do |file|
	require "plympton/#{File.basename(file, File.extname(file))}"
end

# Add in the YAML parsing hooks
YAML.add_domain_type("fuzz.io,2011", "Object") do |type, val|
	YAML.object_maker(Plympton::Object, val) 
end

YAML.add_domain_type("fuzz.io,2011", "Function") do |type, val|
	YAML.object_maker(Plympton::Function, val) 
end

YAML.add_domain_type("fuzz.io,2011", "Chunk") do |type, val|
	YAML.object_maker(Plympton::Chunk, val) 
end

YAML.add_domain_type("fuzz.io,2011", "Block") do |type, val|
	YAML.object_maker(Plympton::Block, val) 
end
