
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
				if arg.class != Variable
					# TODO : Add code to verify that variable is a symbol of constructor
					raise "Non root symbol of a pattern must be a variable"
				end
			end
		end
	end

end

# code to test sanity check in Pattern
=begin
a = XSymbol.new("a",2,:oper)
x = XSymbol.new("x",1,:ctor)
y = Variable.new("y")
app = Application.new(a,[x,y])
p = Pattern.new(app)
=end


@constructors_hash = {}