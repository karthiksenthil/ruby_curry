
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


def compile(def_tree)
	#(1) to handle the case when the node is a Branch
	if def_tree.class == Branch
		def_tree.children.each do |child|
			compile(child)		
		end

		inductive_var = def_tree.variable
		branch_patt = def_tree.pattern
		output = 'H(' + branch_patt.show() + ') = '

		# for the RHS of the branch, replace the inductive_var by H(inductive_var)
		# code fails when inductive_var occurs in nested arguments
=begin
		branch_patt_rhs = branch_patt.symbol.name+"("
  	branch_patt.arguments.each do |arg|
  		if arg == inductive_var
  			branch_patt_rhs += 'H('+arg.show()+'),'
  		else
  			branch_patt_rhs += arg.show()+","
  		end
  	end
  	# to remove the last comma
  	if branch_patt_rhs[-1] == ','
  		branch_patt_rhs[-1] = ''
  	end

  	output += 'H('+branch_patt_rhs+')'
=end

		# using gsub on branch pattern(naive,temporary)
		branch_patt_sub = branch_patt.show()
		branch_patt_sub.gsub! inductive_var.show(),'H(' + inductive_var.show() +')'
		output += 'H(' + branch_patt_sub +')'

		print output+"\n"
	
	#(2) to handle the case when the node is a Leaf(Rule)
	elsif def_tree.class == Leaf
		rule_rhs = def_tree.expression
		output = ''
		# to handle the case when RHS of the rule is a pattern or symbol
		if rule_rhs.class == Application || rule_rhs.class == XSymbol
			# identify the leading symbol of RHS 
			leading_symbol = rule_rhs.class == Application ? rule_rhs.symbol : rule_rhs
			output = 'H(' + def_tree.pattern.show() + ') = '
			if leading_symbol.kind == :oper  # case (2.1) i.e. operator-rooted
				output += 'H(' + rule_rhs.show() +')'
			elsif leading_symbol.kind == :ctor	# case (2.2) i.e. constructor-rooted
				output += rule_rhs.show()
			end
								
		# to handle the case when the RHS of the rule is a variable
		elsif rule_rhs.class == Variable			
			# code to handle case of variable

		end 
		
		print output+"\n"


	#(3) to handle the case when the node is Exempt 
	elsif def_tree.class == Exempt
		output = 'H(' + def_tree.pattern.show() + ') = abort'
		print output+"\n"
	end

end





