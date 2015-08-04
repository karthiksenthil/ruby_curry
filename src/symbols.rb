# Class to denote symbols in an expression

# Constant integer tokens used for XSymbol
VARIABLE = 0
CHOICE = 1
OPERATION = 2
FAIL = 3
# the constructor symbols take a token value starting from 4
CONSTRUCTOR = 4 

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

  # empty function H defined by subclasses
  def H(expr)
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
    # arity of Choice -> 0
    super("?",0)
  end

  def token
    return CHOICE
  end

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


