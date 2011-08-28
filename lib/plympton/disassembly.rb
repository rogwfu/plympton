module Plympton
	# Class responsible for working with a disassembly
	class Disassembly
		attr_accessor	:attributes
		attr_accessor	:functionHitTrace

		# Create an instance of the disassembly class
		# Reads in a YAML serialized disassembly
		# @param [String] Path to the YAML serialized disassembly
		def initialize(yamlDisassembly)

			# Check for existence of the file
			if(!File.exists?(yamlDisassembly)) then
				return(nil)
			end

			# Unserialize the YAML disassembly
			@attributes = YAML.load(File.open(yamlDisassembly))	
			@attributes.setup()

			# Allocate a hash for function hit tracing
			@functionHitTrace = Hash.new()
		end

		# Function to process hit tracing recorded by Valgrind tools (rufus and callgrind)
		# @param [String] Path to a valgrind trace file
		def valgrind_coverage(valgrindTrace)

			# Open the valgrind xml trace file
			xmlFile = File.open(valgrindTrace, "r")
			xmlDoc = Nokogiri::XML(xmlFile)

			# Delete any previous hit traces
			functionHitTrace.clear()

			# Parse all the function hits 
			xmlDoc.xpath("//hit").each do |hit|
				functionOffset = hit.search("offset").first().inner_text()
				if(@attributes.functionHash.has_key?(functionOffset)) then
					if(!@functionHitTrace.has_key?(functionOffset)) then
						@functionHitTrace[functionOffset] = 1 
					else
						@functionHitTrace[functionOffset] = @functionHitTrace[functionOffset] + 1 
					end
				end

				# Parse all the functions this function called
				hit.xpath("callee").each do |callee|
					calleeOffset = callee.search("offset").first().inner_text()
					numberOfCalls = callee.search("numberOfCalls").first().inner_text().to_i()
					if(@attributes.functionHash.has_key?(calleeOffset)) then
						if(!@functionHitTrace.has_key?(functionOffset)) then
							@functionHitTrace[functionOffset] = numberOfCalls 
						else
							@functionHitTrace[functionOffset] = @functionHitTrace[functionOffset] + numberOfCalls 
						end
					end
				end
			end
			
			# Cleanup open file
			xmlFile.close()
		end
	
	end
end
