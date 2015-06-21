
# Basic building block classes for the nodes of tree

# Class to denote symbols in an expression
class XSymbol
  attr_accessor :name, :arity, :kind
  
  # create a symbol with its name, arity and kind/type
  # Params : name(string), arity(integer), kind(:ctor/:oper)
  # Return : XSymbol
  def initialize(name,arity,kind)
    @name = name	# the printable representation of symbol
    @arity = arity
    @kind = kind	# either operator or constructor
  end

  def show
  	return @name
  end
  
end

class Expression

	# abstract function
	# Functionality : replace an expression by an executable expression
	def replace
	end

	# abstract function
	# Functionality : check if expression is a constructor-rooted expression
	def construct_expr?
	end

end

# Class to denote variables
class Variable < Expression
	attr_accessor :name,:type

	# create a varible with its name
	# Params : name(string)
	# Return : Variable
	def initialize(name,type)
		@name = name # the printable representation of variable
		@type = type # tags the Variable with its type
	end

	def show
		return @name
	end

	# check if variable is a constructor-rooted expression
	# Return : true(boolean)
	def construct_expr?
		return true
	end

	def ==(another_variable)
		if another_variable.class == Variable
			self.name == another_variable.name
		else
			false
		end
	end

end

# Class to denote applications
class Application < Expression
  attr_accessor :symbol, :arguments
  
  # create an application with a root-symbol and arguments
  # Params : symbol(XSymbol), arguments(array of Expression/XSymbol)
  # Return : Application
  def initialize(symbol,arguments)
    @symbol = symbol
    @arguments = arguments
  end
  
  # give a representation of an application
  # for example, xs ++ ys ==> ++(xs,ys)
  # Return : output(string)
  def show
  	output = symbol.name+"("
  	if !@arguments.nil?
  		@arguments.each do |arg|
  			output += arg.show()+","
  		end
  	end
  	
  	if output[-1] == ',' # to remove the last comma
  		output[-1] = ''
  		output += ")"
		elsif output[-1] == '(' # case to remove '(' if Application has no arguments
			output[-1] = ''
  	end
	
		return output
  end

  # check if variable is a constructor-rooted expression
	# Return : true/false(boolean)
  def construct_expr?
  	return self.symbol.kind == :ctor && self.arguments.map{|a| a.construct_expr?}.all? 
  end

  def ==(another_application)
  	if another_application.class == Application
  		return self.symbol == another_application.symbol && self.arguments == another_application.arguments
  	else
  		false
  	end
  end

end

# Pattern is an application meeting certain conditions
class Pattern < Application
	
	# perform a sanity check on a new Pattern
	# if error raise corresponding exception
	# Params : application(Application)
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

# Data-structure to store the constructors of a type
# Key : data type
# Values : array of XSymbols(constructors)
$constructors_hash = {}


### APPENDIX ###
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
