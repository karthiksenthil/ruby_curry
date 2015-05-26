
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


# Rules:
# General : append xs ys
# 1. append [] ys = ys
# 2. append (z:zs) ys = z:(append zs ys)

# Symbols in the rules
append_symbol = XSymbol.new("append",2,:oper)
nil_list_symbol = XSymbol.new("[]",0,:ctor)
cons_symbol = XSymbol.new(":",2,:ctor)

# Variables in the rules
xs = Variable.new("xs")
ys = Variable.new("ys")
z = Variable.new("z")
zs = Variable.new("zs")

# child1 i.e rule1 ; lhs = pattern and rhs = expression
lhs1 = Application.new(append_symbol,[nil_list_symbol,ys])
rhs1 = ys	
child1 = Leaf.new(lhs1,rhs1)

# child2 i.e rule2
# (z:zs) itself is another sub-pattern which is built using the : symbol
lhs2 = Application.new(append_symbol,[Application.new(cons_symbol,[z,zs]),ys])
rhs2 = Application.new(cons_symbol,[z,Application.new(append_symbol,[zs,ys])])
child2 = Leaf.new(lhs2,rhs2)

# definitional tree for above rules

rootpatt = Application.new(append_symbol,[xs,ys])
append_tree = Branch.new(rootpatt,xs,[child1,child2])






