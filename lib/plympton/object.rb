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
		attr_accessor   :probMatrix
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

			# Precompute number of instructions per function and set markovIdx
			markovIdx = 1
			@functionList.each do |function|
				function.set_total_number_of_instructions()
				function.markovIdx = markovIdx
				function.numTransitions = BigDecimal("0")
				markovIdx += 1
			end

			# Allocate transition matrix and probMatrix(# functions + special state 0)
			# Transition matrix persists probMatrix recalculated
			dimension = @functionHash.size() + 1
			@transitionMatrix = NMatrix.object(dimension, dimension).fill!(BigDecimal("0"))
			@probMatrix = NMatrix.object(dimension, dimension).fill!(BigDecimal("0"))
#			@transitionMatrix = PlymptonMatrix.square(@functionHash.size() + 1)
#			@probMatrix = PlymptonMatrix.square(@functionHash.size() + 1)
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

		# Stub function for now to calculate the steady state transition probability 
		# Function to calculate Uniqueness of path taken:
		# http://www.cs.ucf.edu/~czou/research/EvolutionaryInputCrafting-ACSAC07.pdf
		# Had to scale due to overflow: log 1/product(pi) = log(productpi)-1 = -log(productpi) = - summation log(pi)
		# @returns [BigDecimal] The steady state transition probability
		def S()
			dimensions = @transitionMatrix.shape()
			rowDimension = dimensions[0]
			colDimension = dimensions[1]
			pMatrix = NMatrix.object(rowDimension, colDimension).fill!(BigDecimal("0"))

			# Need to remember Markov state 0!!!!
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
			pathUniqueness = pathUniqueness + Math.log(probability)
			pathUniqueness = Math.abs(pathUniqueness)
		
			return(BigDecimal("0"))
		end

		# Function to calculate the function coverage of a test case run
		# Total number of unique functions/Total number of unique functions executed
		# @returns [BigDecimal] The percentage 
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
