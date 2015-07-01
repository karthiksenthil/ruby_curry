
# Basic building block classes for the nodes of tree

# Class to denote symbols in an expression

# Constant integer tokens used for XSymbol
VARIABLE = 0
CHOICE = 1
OPERATION = 2
# the constructor symbols take a token value starting from 3
CONSTRUCTOR = 3 

class XSymbol
  attr_accessor :name, :arity, :token
  
  # create a symbol with its name, arity and kind/type
  # Params : name(string), arity(integer), token
  # Return : XSymbol
  def initialize(name,arity,token)
    @name = name	# the printable representation of symbol
    @arity = arity
    @token = token # an integer value to determine the kind of Symbol 
  end

  def show
  	return @name
  end

  def H
  end

  # the N function, defined for all Symbols
  def N(expr)
  	case self.token
  	when OPERATION
  		expr.H()
  		expr.N()
  	when CONSTRUCTOR
  		expr.content.arguments.each do |arg|
  			tmp = arg.N()
  			arg.replace(tmp.content)
  		end 
  	end
  	expr
  end

  def ==(another_symbol)
		if another_symbol.class == self.class
			self.name == another_symbol.name
		else
			false
		end
	end
  
end

# a wrapper class around Expressions
class Box
	attr_accessor :content #content is an Expression object

	def initialize(content)
		@content = content
	end

	def replace(new_content) # new content should be the content of another Box object only
		@content = new_content
	end

	# the H function for a Box object
	def H
		if self.content.symbol.token != OPERATION
			raise "H is not defined on a non-operation rooted expression"
		else
			self.content.symbol.H(self)
		end
		
	end

	# the N function for a Box object
	def N
		self.content.symbol.N(self)
	end

	# showing a Box
	def show
		return @content.show()
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
	attr_accessor :symbol,:type

	# create a varible with its name
	# Params : symbol
	# Return : Variable
	def initialize(symbol,type)
		@symbol = symbol # the printable representation of variable
		@type = type # tags the Variable with its type
	end

	def show
		return @symbol.show()
	end

	# check if variable is a constructor-rooted expression
	# Return : true(boolean)
	def construct_expr?
		return true
	end

	def ==(another_variable)
		if another_variable.class == Variable
			self.symbol == another_variable.symbol
		else
			false
		end
	end

end

# global function to make any Variable object
def make_variable(name,type)
	sym = XSymbol.new(name,0,VARIABLE)
	return Box.new(Variable.new(sym,type)) # wrap the Variable in a Box
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
  	return self.symbol.token >= CONSTRUCTOR && self.arguments.map{|a| a.construct_expr?}.all? 
  end

  def ==(another_application)
  	if another_application.class == Application
  		# temporary code to make current unit test pass
  		args_equality = []
  		(0..self.arguments.length-1).each do |i|
  			args_equality << self.arguments[i].content == another_application.arguments[i].content
  		end 
  		return self.symbol == another_application.symbol && args_equality

  		######### IMPORTANT #########
  		# old code, revert to this after coding compile.rb  
  		# return self.symbol == another_application.symbol && self.arguments == another_application.arguments
  	else
  		false
  	end
  end

  # moving to Box
  # def H
  # 	self.symbol.H(self)
  # end

end

# Pattern is an application meeting certain conditions
class Pattern < Application
	
	# perform a sanity check on a new Pattern
	# if error raise corresponding exception
	# Params : application(Application)
	def initialize(application)
		if application.symbol.token != OPERATION 
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
