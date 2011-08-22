module Plympton
	# Class responsible for parsing a YAML serialized object
	class Object 
		# YAML entries
		attr_accessor   :textSegmentStart, :textSegmentEnd, :functionList, :importList, :numFunctions, :numImports, :numBlocks, :name 

		# Class Attributes not imported via YAML
		attr_accessor   :functionHash

		# Defines the objects YAML tag
		def to_yaml_type
			"!fuzz.io,2011/Object"
		end

		# Creates hashes for function lookup and cleans up data imported via YAML::load 
		def setup()
			@name.chomp!()
			init_function_hash()
		end

		private

		# Convenience method for creating a lookup hash for functions
		def init_function_hash()
			@functionHash = Hash.new()
			@functionList.each do |function|
				@functionHash[function.startAddress] = function
			end
		end

		# Convenience method for creating a lookup hash for blocks 
		def init_block_hash()

		end

		# Convenience method for printing a chromosome
		# @return [String] A string representation of the chromosome object
		def to_s()
			"#{self.class} (#{self.__id__}):\n#{name}\t#{textSegmentStart}\t#{textSegmentEnd}\t#{numFunctions}\t#{numImports}\t#{numBlocks}"
		end
	end
end
