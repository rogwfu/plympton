class NMatrix 
	# Class Methods

	# Create a new square matrix of BigDecimal 0 objects
	# @param [Fixnum] Number of rows and columns
#	def self.square(dimension)
#		matrix = PlymptonMatrix.object(dimension, dimension)
#		matrix.fill!(BigDecimal("0"))
#		puts matrix.class()
#		return(matrix)
#	end

	def investigate()
		dimensions = shape()
		rowDimension = dimensions[0]
		colDimension = dimensions[1]
		puts ""
		for row in 0...rowDimension 
			for column in 0...colDimension
				print " %10f" % self[row, column].to_s('F')
			end
			puts""
		end
	end

	# Allocate a matrix of BigDecimal zeros
	# @param [Fixnum] Size of the square matrix n x n
	# @returns [PlymptonMatrix] An n x n matrix with every entry a BigDecimal("0")
#	def self.zero(size)
#		PlymptonMatrix.build(size) do
#			BigDecimal("0")
#		end
#	end

	# Instance Methods 
	# Prints the string representation of a Matrix object 
	# @params [Hash] Hash of functions defined by an object
#	def to_s()
#		rowSize = row_size()
#		colSize = column_size()
#
#		# Print Matrix Header
#		print "%12s" % ""
#		for colIdx in 0...colSize do
#			print "%10d" % colIdx
#		end
#		spacer = "-" * 100
#		print "\n           %s\n" % spacer 
#
#		for rowIdx in 0...rowSize do
#			print "%10d |" % rowIdx 
#			for colIdx in 0...colSize do
#				print" %10f" % self[rowIdx, colIdx].to_s('10F')
#			end
#			print(" |\n")
#		end
#		nil
#	end
end
