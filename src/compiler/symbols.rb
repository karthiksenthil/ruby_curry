# Class to denote symbols in an expression

# Constant integer tokens used for XSymbol
VARIABLE = 0
CHOICE = 1
OPERATION = 2
FAIL = 3
# the constructor symbols take a token value starting from 4
CONSTRUCTOR = 4 

# global boolean to trace program
$trace = true
# global boolean for backtrack
$backtrack = false
# array to store poosible output expressions
$output_expressions = []

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

  def show
  	return @name
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
  # every operation has a definitional tree
  attr_accessor :def_tree

  def initialize(name,arity,def_tree)
    super(name,arity)
    @def_tree = def_tree
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
    super("choice",2)
  end

  def token
    return CHOICE
  end

end

# constructor for making Choice object
def make_choice(x,y)
  return Box.new(Application.new(Choice.new,[x,y]))
end

$choice_symbol = Choice.new

# standard H function for Choice symbol
def $choice_symbol.H(expr)
  left_argument = expr.content.arguments[0]

  case left_argument.content.symbol.token
  when CHOICE, OPERATION
    # first argument is another CHOICE or OPERATION ; simplify it
    left_argument.H()
    expr.replace(left_argument.content)
  else
    # first argument is a CONSTRUCTOR or FAIL
    expr.replace(left_argument.content)
  end
  expr
end


class Fail < XSymbol

  def initialize
    super("fail",0)
  end

  def token
    return FAIL
  end

end

$fail_symbol = Fail.new