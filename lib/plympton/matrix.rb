require 'matrix'

class PlymptonMatrix < Matrix
	# Class Methods

	# Allocate a matrix of BigDecimal zeros
	# @param [Fixnum] Size of the square matrix n x n
	# @returns [Matrix] An n x n matrix with every entry a BigDecimal("0")
	def self.zero(size)
		Matrix.build(size) do
			BigDecimal("0")
		end
	end

	# Instance Methods 
	# Prints the string representation of a Matrix object 
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
#				print" %10d" % self[rowIdx, colIdx]
#			end
#			print(" |\n")
#		end
#		nil
#	end
#
#	# Prints the string representation with function address indices
#	# @param [Hash] Hash of functions defined by an object 
#	def to_s(functionHash)
#
#	end
#
	
end
