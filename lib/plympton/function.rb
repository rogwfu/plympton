module Plympton
	# Class responsible for parsing a YAML serialized function object
    class Function
		# YAML Entries
        attr_accessor   :name, :startAddress, :endAddress, :savedRegSize, :localVarSize, :argSize, :numArgs, :numLocalVars, :isImport, :numChunks, :chunkList, :cyclomaticComplexity
		
        attr_accessor   :idx
    end
end
