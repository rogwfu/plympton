module Plympton
	# Class responsible for parsing a YAML serialized object
    class Object 
        # YAML entries
        attr_accessor   :textSegmentStart, :textSegmentEnd, :functionList, :importList, :numFunctions, :numImports, :numBlocks, :name 
	end
end
