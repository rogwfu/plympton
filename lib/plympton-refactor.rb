require 'yaml'
require 'gsl'
Dir[File.dirname(__FILE__) + "/plympton/*.rb"].each do |file|
	require File.basename(file, File.extname(file))
end

# Add in the YAML parsing hooks
YAML.add_domain_type("fuzz.io.yaml.org,2002", "Program") do |type, val|
    YAML.object_maker(Plympton::Program, val) 
end

YAML.add_domain_type("fuzz.io.yaml.org,2002", "Function") do |type, val|
    YAML.object_maker(Plympton::Function, val) 
end

YAML.add_domain_type("fuzz.io.yaml.org,2002", "Chunk") do |type, val|
    YAML.object_maker(Plympton::Chunk, val) 
end

YAML.add_domain_type("fuzz.io.yaml.org,2002", "Block") do |type, val|
    YAML.object_maker(Plympton::Block, val) 
end

