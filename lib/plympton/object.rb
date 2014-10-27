module Plympton
	# Class responsible for parsing a YAML serialized object
	class Object 
		# YAML entries
		attr_accessor   :textSegmentStart, :textSegmentEnd, :functionList, :importList, :numFunctions, :numImports, :numBlocks, :name 

		# Class Attributes not imported via YAML
		attr_accessor	:runtime
		attr_accessor   :functionHash
		attr_accessor	:functionHitTrace
		attr_accessor	:transitionMatrix
		attr_accessor	:trace

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

			# Add in the markov function (any function not defined by a shared library)
			markovFunction = Plympton::Function.new() 
			markovFunction.markovIdx = 0
			markovFunction.numTransitions = BigDecimal("0")
			@functionHash["-1"] = markovFunction

			# Precompute number of instructions per function and set markovIdx
			markovIdx = 1
			@functionList.each do |function|
				function.set_total_number_of_instructions()
				function.markovIdx = markovIdx
				function.numTransitions = BigDecimal("0")
				markovIdx += 1
			end

			# Allocate transition matrix (# functions + special state 0)
			# Transition matrix persists across test case runs
#			dimension = @functionHash.size() + 1
			dimension = @functionHash.size()
#			@transitionMatrix = NMatrix.object(dimension, dimension).fill!(BigDecimal("0"))

			# Allocate a trace for Markov chains
			@trace = Array.new()
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
						result = result + BigDecimal("#{@functionHash[offset].send(attribute.to_sym())}") * BigDecimal("#{numberTimesExecuted[0]}")
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
					numFunctionsExecuted = numFunctionsExecuted + BigDecimal("#{numberTimesExecuted[0]}")
				end

				send(sum_function.to_sym())/numFunctionsExecuted
			end
		end

		# Define all the sum and average functions
		{"A" => :numArgs, "B" => :numLocalVars, "C" => :argSize, "D" => :localVarSize,"E" => :numInstructions,"F" => :frameSize,"G" => :cyclomaticComplexity}.each do |variable, attribute|
			define_sum_avg(variable, attribute)
		end

		# Function to calculate execution path uniqueness:
		# http://www.cs.ucf.edu/~czou/research/EvolutionaryInputCrafting-ACSAC07.pdf
		# Had to scale due to overflow: log 1/product(pi) = log(productpi)-1 = -log(productpi) = - summation log(pi)
		# @return [BigDecimal] The steady state transition probability
		def U()
			dimensions = @transitionMatrix.shape()
			rowDimension = dimensions[0]
			colDimension = dimensions[1]
			pMatrix = NMatrix.object(rowDimension, colDimension).fill!(BigDecimal("0"))

			# Calculate the new transition probabilities
			@functionHash.each_value do |function|
				rowIdx = function.markovIdx
#				puts "#{function.startAddress}: #{function.numTransitions.to_s("F")}"
				for column in 0...colDimension
					if(function.numTransitions != BigDecimal("0")) then
						pMatrix[rowIdx,column] = @transitionMatrix[rowIdx,column]/function.numTransitions
					end
				end
			end

			# Calculate the statistic for function path uniqueness
			pathUniqueness = BigDecimal("0")
			@trace.each do |callTrace|
				traceArr = callTrace.split(":")
				traceArr[2].to_i.times do
					#pathUniqueness += BigMath.log(pMatrix[traceArr[0].to_i(), traceArr[1].to_i()], 6)
					pathUniqueness += Math.log(pMatrix[traceArr[0].to_i(), traceArr[1].to_i()].to_f())
				end
			#	puts "#{pMatrix[traceArr[0].to_i(), traceArr[1].to_i()].to_f()}"
			end

			#puts "Path Uniqueness is: #{pathUniqueness.to_s("F")}"	
			pathUniqueness = BigDecimal(pathUniqueness.abs.to_s())
			#puts "Path Uniqueness is: #{pathUniqueness.to_s("F")}"	
			@trace.clear()
			return(pathUniqueness)
		end

		# Function to calculate the function coverage of a test case run
		# Total number of unique functions/Total number of unique functions executed
		# @return [BigDecimal] The percentage 
		def V()
			functionCoverage = @functionHitTrace.length()/@numFunctions
			return(BigDecimal(functionCoverage.to_s()))	
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
