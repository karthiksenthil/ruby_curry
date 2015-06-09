
# Basic building block classes for the nodes of tree

class XSymbol
  attr_accessor :name, :arity, :kind
  
  def initialize(name,arity,kind)
    @name = name
    @arity = arity
    @kind = kind
  end

  def show
  	return @name
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

	def show
		return @name
	end

	def replace(var)
		# puts var.name,self.name
		if self.name == var.name
			replaced_var = H.new(var)
			return replaced_var.show()
		else
			return self
		end
	end

end

class Application < Expression
  attr_accessor :symbol, :arguments
  
  def initialize(symbol,arguments)
    @symbol = symbol
    @arguments = arguments
  end
  
  def show
  	output = symbol.name+"("
  	@arguments.each do |arg|
  		output += arg.show()+","
  	end

  	# to remove the last comma
  	if output[-1] == ','
  		output[-1] = ''
  	end

  	output += ")"
		return output
  end

  def replace(var)
  	args = @arguments.map { |a| a.replace(var)  }
  	return Application.new(@symbol,args)
  end

end

# Subclass to encode H operation around an expression
class H < Expression
	attr_accessor :h_expr
	
	def initialize(expr)
		@h_expr = 'H('+expr.show()+')'
	end

	def show
		return Variable.new(@h_expr)
	end

end



# Base class node for Definitional tree
class DefTreeNode
	attr_accessor :pattern

	def initialize(pattern)
		@pattern = pattern
	end

	def pretty_print(n=0)
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


