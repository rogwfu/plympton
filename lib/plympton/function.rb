module Plympton
	# Class responsible for parsing a YAML serialized function object
    class Function
		# YAML Entries
        attr_accessor   :name, :startAddress, :endAddress, :savedRegSize, :localVarSize, :argSize, :frameSize, :numArgs, :numLocalVars, :isImport, :numChunks, :chunkList, :cyclomaticComplexity

		attr_accessor :numInstructions

        # Defines the objects YAML tag
		# @return [String] A string signifying the start of an object of this class
		def to_yaml_type
			"!fuzz.io,2011/Function"
		end

		def set_total_number_of_instructions()
			@numInstructions = 0
			@chunkList.each do |chunk|
				chunk.blockList.each do |block|
					@numInstructions = @numInstructions + block.numInstructions
				end
			end
		end
		
        # Convenience method for printing a function 
        # @return [String] A string representation of a function object
		def to_s()
			"#{self.class} (#{self.__id__}):#{name}"
		end
    end
end
