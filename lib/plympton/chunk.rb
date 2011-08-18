module Plympton
	# Class responsible for parsing a YAML serialized chunk object
    class Chunk
		# YAML entries
        attr_accessor   :startEA, :endEA, :blockList, :numBlocks
    end
end
