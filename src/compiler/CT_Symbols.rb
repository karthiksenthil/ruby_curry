module CT_Symbols

  # Constant integer tokens used for XSymbol
  CT_Symbols::VARIABLE = 0
  CT_Symbols::CHOICE = 1
  CT_Symbols::FAIL = 2
  CT_Symbols::OPERATION = 3
  # the constructor symbols take a token value starting from 4
  CT_Symbols::CONSTRUCTOR = 4 

  # Base class of all symbols
  class XSymbol
    attr_accessor :name, :arity
    
    # create a symbol with its name, arity and kind/type
    # Params : name(string), arity(integer)
    def initialize(name,arity)
      # the printable ruby representation of this Curry symbol
      @name = name
      @arity = arity
    end

    # function to convert ruby variable name to curry name
    def conv_ruby_var
      parts = @name.split("::")
      mod = parts[0]
      n = parts[1][3..-1]
      # p parts, mod, n
      
      spchars = n.scan(/\_[0-9A-F]{2}/)
      spchars.each do |sc|
        n.sub!(sc, sc[1..-1].to_i(16).chr)
      end

      return mod + "::" + n
    end

    def to_s
      return conv_ruby_var
    end

    def ==(another_symbol)
      return another_symbol.class == self.class && another_symbol.name == name
    end
    
  end

  # first type of Symbol -> Operation
  class Operation < XSymbol

    def initialize(name,arity)
      super(name,arity)
    end

    def token
      return CT_Symbols::OPERATION
    end

  end

  # second type of Symbol -> Constructor
  class Constructor < XSymbol
    attr_accessor :token

    def initialize(name,arity,token)
      super(name,arity)
      @token = token
    end

    def token
      return @token
    end

  end


  class Variable_symbol < XSymbol

    def initialize(name,arity)
      super(name,arity)
    end

    def token
      return CT_Symbols::VARIABLE
    end

  end

  class Choice < XSymbol

    def initialize
      super("CT_System::CT_choice",2)
    end

    def token
      return CT_Symbols::CHOICE
    end

  end

  # partial application wrapper,
  # missing is the number of missing arguments
  # the other argument is a partial application with missing arguments
  class Partial < Constructor
    def initialize
      super("CT_System::CT_partial",2,CT_Symbols::CONSTRUCTOR)
    end
  end

  class Fail < XSymbol

    def initialize
      super("Prelude::CT_failed",0)
    end

    def token
      return CT_Symbols::FAIL
    end

  end

end
