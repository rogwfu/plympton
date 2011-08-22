module Plympton
	# Class responsible for parsing a YAML serialized chunk object
    class Chunk
		# YAML entries
        attr_accessor   :startEA, :endEA, :blockList, :numBlocks

        # Defines the objects YAML tag
        def to_yaml_type
            "!fuzz.io,2011/Chunk"
        end

        # Convenience method for printing a chunk 
        # @return [String] A string representation of a chunk object 
		def to_s()
			"#{self.class} (#{self.__id__}):"
		end

    end
end
