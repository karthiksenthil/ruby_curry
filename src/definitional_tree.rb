
# Basic building block classes for the nodes of tree

class XSymbol
  attr_accessor :name, :arity, :kind
  
  def initialize(name,arity,kind)
    @name = name
    @arity = arity
    @kind = kind
  end
  
end

class Expression
end

class Pattern < Expression
end

class Variable < Expression
	attr_accessor :name

	def initialize(name)
		@name = name
	end

end

class Application < Expression
  attr_accessor :symbol, :arguments
  
  def initialize(symbol,arguments)
    @symbol = symbol
    @arguments = arguments
  end
  
end

# Base class node for Definitional tree
class DefTreeNode
	attr_accessor :pattern

	def initialize(pattern)
		@pattern = pattern
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

end

class Exempt < DefTreeNode
end

class Leaf < DefTreeNode
	attr_accessor :expression

	def initialize(pattern,expression)
		super(pattern)
		@expression = expression
	end

end




