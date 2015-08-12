require_relative './expressions.rb'


# Base class node for Definitional tree
class DefTreeNode
	attr_accessor :pattern

	def initialize(pattern)
		@pattern = pattern
	end

	def pretty_print(n=0)
	end

	def compile
	end

end

# Subclasses of a DefTreeNode - Branch, Exempt and Leaf
class Branch < DefTreeNode
	attr_accessor :variable,:children

	def initialize(pattern,variable,children)
		super(pattern)
		@variable = variable
		@children = children
	end

	def pretty_print(n=0)
		print "\n"
		# print 2n spaces + symbol(arguments) + : + variable
		print ' '*2*n + @pattern.show() + " : " + @variable.show()
		@children.each do |child|
			child.pretty_print(n+1)
		end
	end

end

class Exempt < DefTreeNode
	
	def initialize(pattern)
		super(pattern)
	end

	def pretty_print(n=0)
		print "\n"
		# print 2n spaces + symbol(arguments)
		print ' '*2*n + @pattern.show() + " -> " + "FAIL"
	end
end

class Leaf < DefTreeNode
	attr_accessor :expression

	def initialize(pattern,expression)
		super(pattern)
		@expression = expression
	end

	def pretty_print(n=0)
		print "\n"
		# print 2n spaces + symbol(arguments) + arrow i.e -> + expression
		print ' '*2*n + @pattern.show() + " -> " + @expression.show()
	end

end


