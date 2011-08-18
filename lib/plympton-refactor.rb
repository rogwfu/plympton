require 'yaml'
require 'gsl'
#Dir[File.dirname(__FILE__) + "/plympton/*.rb"].each do |file|
	  puts "hey" 
#	require File.basename(file, File.extname(file))
#end
#require 'plympton/idaprogram'
#require 'plympton/idafunction'
#require 'plympton/idachunk'
#require 'plympton/idablock'

# Add in the YAML parsing hooks
#YAML.add_domain_type("fuzz.io.yaml.org,2002", "IdaProgram") do |type, val|
#    YAML.object_maker(Plympton::IdaProgram, val) 
#end

#YAML.add_domain_type("fuzz.io.yaml.org,2002", "IdaFunction") do |type, val|
#    YAML.object_maker(Plympton::IdaFunction, val) 
#end

#YAML.add_domain_type("fuzz.io.yaml.org,2002", "IdaChunk") do |type, val|
#    YAML.object_maker(Plympton::IdaChunk, val) 
#end

#YAML.add_domain_type("fuzz.io.yaml.org,2002", "IdaBlock") do |type, val|
#    YAML.object_maker(Plympton::IdaBlock, val) 
#end

