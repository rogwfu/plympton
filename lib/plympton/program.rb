module Plympton
	# Class responsible for parsing a YAML serialized program object
    class Program
        # YAML entries
        attr_accessor   :textSegmentStart, :textSegmentEnd, :functionList, :importList, :numFunctions, :numImports, :numBlocks, :disName 
	end
end
