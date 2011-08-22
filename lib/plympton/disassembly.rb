module Plympton
	# Class responsible for working with a disassembly
	class Disassembly
		attr_accessor	:attributes

		# @param [String] Path to the YAML serialized disassembly
		def initialize(yamlDisassembly)
			
			# Check for existence of the file
			if(!File.exists?(yamlDisassembly)) then
				return(nil)
			end

			# Unserialize the YAML disassembly
			@attributes = YAML.load(File.open(yamlDisassembly))	

			# 
#			@attributes.setup()
#			@attributes.hello()
#			puts @attributes.class()
			#puts @attributes.keys()
			#@attributes["name"].chomp!()
			#puts @attributes["numBlocks"]
		end
	end
end
