module Plympton
	# Class responsible for parsing a YAML serialized block object
    class Block
		# YAML Entries
        attr_accessor   :startEA, :endEA, :numInstructions

		# Defines the objects YAML tag
		# @return [String] A string signifying the start of an object of this class
        def to_yaml_type
            "!fuzz.io,2011/Block"
        end

        # Convenience method for printing a block 
        # @return [String] A string representation of a block object
		def to_s()
			"#{self.class} (#{self.__id__}):  Start Address: #{startEA}, End Address #{endEA}, No. of Instructions: #{numInstructions}"
		end
    end
end
