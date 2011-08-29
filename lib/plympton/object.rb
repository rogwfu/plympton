module Plympton
	# Class responsible for parsing a YAML serialized object
	class Object 
		# YAML entries
		attr_accessor   :textSegmentStart, :textSegmentEnd, :functionList, :importList, :numFunctions, :numImports, :numBlocks, :name 

		# Class Attributes not imported via YAML
		attr_accessor	:runtime
		attr_accessor   :functionHash
		attr_accessor	:functionHitTrace

		# Defines the objects YAML tag
		# @return [String] A string signifying the start of an object of this class
		def to_yaml_type
			"!fuzz.io,2011/Object"
		end

		# Creates hashes for function lookup and cleans up data imported via YAML::load 
		def setup()
			# Housekeeping on library name
			@name.chomp!()

			# Allocate a hash for function hit tracing
			@functionHitTrace = Hash.new()

			# Create a function hash for lookups
			init_function_hash()

			# Precompute number of instructions per function
			@functionList.each do |function|
				function.set_total_number_of_instructions()
			end
		end

		# 
		# @param [String] Base variable name to create a sum and average function
		# @param [Symbol] Associated instance variable to calculate the sum and average
		def self.define_sum_avg(variable, attribute)
			sum_function = variable + "s"
			define_method(sum_function.to_sym()) do 
				result = BigDecimal("0")
				if(@functionHitTrace !=nil and @functionHitTrace.length() > 0) then
					# Iterate through the function's hit hash
					@functionHitTrace.each do |offset, numberTimesExecuted|
						result = result + BigDecimal("#{@functionHash[offset].send(attribute.to_sym())}") * BigDecimal("#{numberTimesExecuted}")
					end
				end
				return(result)
			end

			# Define the average function
			avg_function = variable + "a"
			define_method(avg_function.to_sym()) do 
				# Catch if the functionHitTrace length is zero
				numFunctionsExecuted = BigDecimal("0") 
				@functionHitTrace.each do |offset, numberTimesExecuted|
					numFunctionsExecuted = numFunctionsExecuted + BigDecimal("#{numberTimesExecuted}")
				end

				send(sum_function.to_sym())/numFunctionsExecuted
			end
		end

		# Define all the sum and average functions
		{"A" => :numArgs, "B" => :numLocalVars, "C" => :argSize, "D" => :localVarSize,"E" => :numInstructions,"F" => :frameSize,"G" => :cyclomaticComplexity}.each do |variable, attribute|
			define_sum_avg(variable, attribute)
		end

		# Stub function for now to calculate the steady state transition probability 
		# @returns [BigDecimal] The steady state transition probability
		def S()
			return(BigDecimal("0"))
		end

		# Function to calculate the function coverage of a test case run
		# Total number of unique functions/Total number of unique functions executed
		# @returns [BigDecimal] The percentage 
		def V()
			functionCoverage = @functionHitTrace.length()/@numFunctions
			return(BigDecimal(functionCoverage.to_s()))	
		end

		# Catch all the average variables since their code is similar
		def method_missing(name, *args)
			sumFunction = name.to_s.sub(/^(.)a$/,"\\1s").to_sym()
			puts "Sum Function is: #{sumFunction}"
			super if(!self.respond_to?(sumFunction))
			return(BigDecimal.new("0")) if args[0].length() == 0
			return(send(sumFunction, args[0])/BigDecimal.new(args[0].length().to_s()))
		end

		private

		# Convenience method for creating a lookup hash for functions based on hex address
		def init_function_hash()
			@functionHash = Hash.new()
			@functionList.each do |function|
				@functionHash[function.startAddress] = function
			end
		end

		# Convenience method for printing a chromosome
		# @return [String] A string representation of the chromosome object
		def to_s()
			"#{self.class} (#{self.__id__}):\n#{name}\t#{textSegmentStart}\t#{textSegmentEnd}\t#{numFunctions}\t#{numImports}\t#{numBlocks}"
		end
	end
end
