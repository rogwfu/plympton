module Plympton
	# Class responsible for parsing a YAML serialized object
	class Object 
		# YAML entries
		attr_accessor   :textSegmentStart, :textSegmentEnd, :functionList, :importList, :numFunctions, :numImports, :numBlocks, :name 

		# Class Attributes not imported via YAML
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
		end

		def self.define_sum_avg(variable, attribute)
			sum_function = variable + "s"
			define_method(sum_function.to_sym()) do 
				puts "Sum function: " + sum_function
				result = BigDecimal("0")
#				if(functionHitTrace !=nil and functionHitTrace.length() > 0) then
					# Iterate through the function's hit hash
#					functionHitTrace.each do |offset, numberTimesExecuted|
#						result = result + @functionHash[offset].attribute * numberTimesExecuted
#					end
#				end
				return(result)
			end

			# Define the average function
			avg_function = variable + "a"
			define_method(avg_function.to_sym()) do 
				puts "Average function: " + avg_function
				# Catch if the functionHitTrace length is zero
				send(sum_function.to_sym())/functionHitTrace.length()
			end
		end

		# Define all the sum and average functions
		{"A" => :a, "B" => :a,"C" => :a,"D" => :a,"E" => :a,"F" => :a,"G" => :a}.each do |variable, attribute|
			define_sum_avg(variable, attribute)
		end

		# @param [Hash] The functions observed executed during a trace
#		def sum(functionsHit)
#			result = BigDecimal("0")
#			if(functionsHit !=nil and functionsHit.length() > 0) then
#				functionsHit.each do |offset, numberTimesExecuted| # hash key is offset, value = numberTimesExecuted
#					result = yield(result, @functionHash[offset], numberTimesExecuted)
#				end
#			end
#			return(result)
#		end
#
#		# Returns the sum number of arguments passed to all functions executed
#		# @param [Hash] The functions observed executed during a trace
#		# @returns [BigDecimal]
#		def As(functionsHit)
#			puts "Sum function: A"
#			sum(functionsHit) do |result, function, timesExecuted|
#				result + function.numArgs * timesExecuted 
#			end
#			return(BigDecimal.new("10"))
#		end
#
#		# Returns the sum number of arguments passed to all functions executed
#		# @param [Hash] The functions observed executed during a trace
#		# @returns [BigDecimal]
#		def Bs(functionsHit)
#			puts "Sum function: B"
##			sum(functionsHit) do |result, function, timesExecuted|
##				result + function.numArgs * timesExecuted 
##			end
#			return(BigDecimal.new("10"))
#		end
#
#		# Returns the sum number of arguments passed to all functions executed
#		# @param [Hash] The functions observed executed during a trace
#		# @returns [BigDecimal]
#		def Cs(functionsHit)
#			puts "Sum function: C"
#			return(BigDecimal.new("10"))
#		end
#
#		# Returns the sum number of arguments passed to all functions executed
#		# @param [Hash] The functions observed executed during a trace
#		# @returns [BigDecimal]
#		def Ds(functionsHit)
#			puts "Sum function: D"
#			return(BigDecimal.new("10"))
#		end
#
#		# Returns the sum number of arguments passed to all functions executed
#		# @param [Hash] The functions observed executed during a trace
#		# @returns [BigDecimal]
#		def Es(functionsHit)
#			puts "Sum function: E"
#			return(BigDecimal.new("10"))
#		end
#
#		# Returns the sum number of arguments passed to all functions executed
#		# @param [Hash] The functions observed executed during a trace
#		# @returns [BigDecimal]
#		def Fs(functionsHit)
#			puts "Sum function: F"
#			return(BigDecimal.new("10"))
#		end
#
#		# Returns the sum number of arguments passed to all functions executed
#		# @param [Hash] The functions observed executed during a trace
#		# @returns [BigDecimal]
#		def Gs(functionsHit)
#			puts "Sum function: G"
#			return(BigDecimal.new("10"))
#		end

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
