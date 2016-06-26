# Class to denote symbols in an expression

# Constant integer tokens used for XSymbol
VARIABLE = 0
CHOICE = 1
FAIL = 2
OPERATION = 3
# the constructor symbols take a token value starting from 4
CONSTRUCTOR = 4 

# function to convert ruby variable name to curry name
def conv_ruby_var(var_name)
  # TODO: Something breaks, maybe due to the naming scheme
  # temporarily disabled
  # Try this code on file curry_examples/xfail_1.curry
  # return var_name
  
  parts = var_name.split("::")
  mod = parts[0]
  n = parts[1][3..-1]
  # p parts, mod, n
  
  spchars = n.scan(/\_[0-9A-F]{2}/)
  spchars.each do |sc|
    n.sub!(sc, sc[1..-1].to_i(16).chr)
  end

  return mod + "::" + n
end

# the base abstract class
class XSymbol
  attr_accessor :name, :arity
  
  # create a symbol with its name, arity and kind/type
  # Params : name(string), arity(integer)
  # Return : XSymbol
  def initialize(name,arity)
    @name = name	# the printable representation of symbol
    @arity = arity
  end

  def to_s
  	return conv_ruby_var(@name)
  end

  def ==(another_symbol)
		if another_symbol.class == self.class
			self.name == another_symbol.name
		else
			false
		end
	end
  
end

# first type of Symbol -> Operation
class Operation < XSymbol

  def initialize(name,arity)
    super(name,arity)
  end

  def token
    return OPERATION
  end

end

# second type of Symbol -> Constructor
class Constructor < XSymbol
  attr_accessor :token_value

  def initialize(name,arity)
    super(name,arity)
  end

  def token
    return @token_value
  end

end


class Variable_symbol < XSymbol

  def initialize(name,arity)
    super(name,arity)
  end

  def token
    return VARIABLE
  end

end

class Choice < XSymbol

  def initialize
    # symbol for Choice -> ?
    # arity of Choice -> 2
    # TODO: what does this name means ???
    super("CT_System::CT_choice",2)
  end

  def token
    return CHOICE
  end

end

# TODO: reconsider
# partial application wrapper,
# missing is the number of missing arguments
# the other argument is a partial application with missing arguments
class Partial < Constructor
  def initialize
    super("CT_System::CT_partial",2)
  end
end

# constructor for making Choice object
def make_choice(x,y)
  return Box.new(Application.new(Choice.new,[x,y]))
end

#z $choice_symbol = Choice.new
#z 
#z # standard H function for Choice symbol
#z def $choice_symbol.H(expr)
#z   left_argument = expr.content.arguments[0]
#z 
#z   case left_argument.content.symbol.token
#z   when CHOICE, OPERATION
#z     # first argument is another CHOICE or OPERATION ; simplify it
#z     left_argument.H()
#z     expr.replace(left_argument.content)
#z   else
#z     # first argument is a CONSTRUCTOR or FAIL
#z     expr.replace(left_argument.content)
#z   end
#z   expr
#z end


class Fail < XSymbol

  def initialize
    super("Prelude::CT_failed",0)
  end

  def token
    return FAIL
  end

end

# $fail_symbol = Fail.new
