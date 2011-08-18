module Plympton
	# Class responsible for working with a disassembly
	class Disassembly
		# @param [String] Path to the YAML serialized disassembly
		def initialize(yamlDisassembly)
			# Check for existence of the file
			if(!File.exists?(yamlDisassembly)) then
				return(nil)
			end

			# Unserialize the YAML disassembly
			@disassembly = YAML::load(File.open(yamlDisassembly))	
		end
	end
end
