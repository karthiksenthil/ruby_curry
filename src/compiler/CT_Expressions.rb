module CT_Expressions

  require_relative './CT_Symbols'

  class Box
    attr_accessor :content #content of a Box is an Expression object

    def initialize(content)
      @content = content
    end

    def H
      @content.symbol.H(self)
    end
  end

  # base class for Variable and Application
  class Expression
  end

  # Class to denote variables
  class Variable < CT_Expressions::Expression
    attr_accessor :symbol,:type

    # create a varible with its name
    # Params : symbol
    # Return : Variable
    def initialize(symbol,type)
      @symbol = symbol # the printable representation of variable
      @type = type # tags the Variable with its type
    end
  end

  # short hand method to declare variables
  def CT_Expressions::make_variable(name,type)
    sym = Variable_symbol.new(name,0) # symbol defined in symbols.rb
    return CT_Expressions::Box.new(CT_Expressions::Variable.new(sym,type))
  end

  # Class to denote applications
  class Application < CT_Expressions::Expression
    attr_accessor :symbol, :arguments
    
    # create an application with a root-symbol and arguments
    # Params : symbol(XSymbol), arguments(array of Expression/XSymbol)
    # Return : Application
    def initialize(symbol,arguments)
      @symbol = symbol
      @arguments = arguments
    end
  end

end
