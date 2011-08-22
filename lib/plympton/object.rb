module Plympton
	# Class responsible for parsing a YAML serialized object
	class Object 
		# YAML entries
		attr_accessor   :textSegmentStart, :textSegmentEnd, :functionList, :importList, :numFunctions, :numImports, :numBlocks, :name 

		# Class Attributes not imported via YAML
		attr_accessor   :functionHash

		# Defines the objects YAML tag
		# @return [String] A string signifying the start of an object of this class
		def to_yaml_type
			"!fuzz.io,2011/Object"
		end

		# Creates hashes for function lookup and cleans up data imported via YAML::load 
		def setup()
			@name.chomp!()
			init_function_hash()
		end

		def self.define_average(variable)
			# Dynamically define an average function
			define_method(variable + "a") do

			end
		end

		# Returns the sum number of arguments passed to all functions executed
		# @param [Hash] The functions observed executed during a trace
		def As(functionsHit)
			puts "Sum function: A"
			return(BigDecimal.new("10"))
		end

		# Returns the sum number of arguments passed to all functions executed
		# @param [Hash] The functions observed executed during a trace
		def Bs(functionsHit)
			puts "Sum function: B"
			return(BigDecimal.new("10"))
		end

		# Returns the sum number of arguments passed to all functions executed
		# @param [Hash] The functions observed executed during a trace
		def Cs(functionsHit)
			puts "Sum function: C"
			return(BigDecimal.new("10"))
		end

		# Returns the sum number of arguments passed to all functions executed
		# @param [Hash] The functions observed executed during a trace
		def Ds(functionsHit)
			puts "Sum function: D"
			return(BigDecimal.new("10"))
		end

		# Returns the sum number of arguments passed to all functions executed
		# @param [Hash] The functions observed executed during a trace
		def Es(functionsHit)
			puts "Sum function: E"
			return(BigDecimal.new("10"))
		end

		# Returns the sum number of arguments passed to all functions executed
		# @param [Hash] The functions observed executed during a trace
		def Fs(functionsHit)
			puts "Sum function: F"
			return(BigDecimal.new("10"))
		end

		# Returns the sum number of arguments passed to all functions executed
		# @param [Hash] The functions observed executed during a trace
		def Gs(functionsHit)
			puts "Sum function: G"
			return(BigDecimal.new("10"))
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

		# Convenience method for creating a lookup hash for functions
		def init_function_hash()
			@functionHash = Hash.new()
			@functionList.each do |function|
				@functionHash[function.startAddress] = function
			end
		end

		# Convenience method for creating a lookup hash for blocks 
		def init_block_hash()

		end

		


		# Convenience method for printing a chromosome
		# @return [String] A string representation of the chromosome object
		def to_s()
			"#{self.class} (#{self.__id__}):\n#{name}\t#{textSegmentStart}\t#{textSegmentEnd}\t#{numFunctions}\t#{numImports}\t#{numBlocks}"
		end
	end
end
