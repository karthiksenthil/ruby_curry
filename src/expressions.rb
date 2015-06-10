
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

	def replace
	end

	def construct_expr?
	end

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
			return Variable.new(replaced_var.show())
		else
			return self
		end
	end

	def construct_expr?
		return true
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

  def construct_expr?
  	return self.symbol.kind == :ctor && self.arguments.map{|a| a.construct_expr?}.all? 
  end

end

# Subclass to encode H operation around an expression
class H < Expression
	attr_accessor :arg
	
	def initialize(arg)
		@arg = arg
	end

	def show
		return 'H('+arg.show()+')'
	end

end

# Pattern is an application meeting certain conditions
class Pattern < Application
	
	def initialize(application)
		if application.symbol.kind != :oper 
			raise "Root symbol of Pattern is not an operator"
		else
			application.arguments.each do |arg|
				if !arg.construct_expr?
					raise "Non root symbol of Pattern is not a variable or a constructor rooted symbol"
				end
			end
		end
	end


end

# code to test sanity check in Pattern
=begin
append_symbol = XSymbol.new("append",2,:oper)
nil_list_symbol = XSymbol.new("[]",0,:ctor)
cons_symbol = XSymbol.new(":",2,:oper)
xs = Variable.new("xs")
ys = Variable.new("ys")
z = Variable.new("z")
zs = Variable.new("zs")
lhs2 = Application.new(append_symbol,[Application.new(cons_symbol,[z,zs]),ys])
p = Pattern.new(lhs2)
=end

@constructors_hash = {}