module CT_Character
  require_relative '../src/compiler/expressions.rb'

  class Char_symbol < Constructor
    attr_accessor :name, :value, :arity, :token
    def initialize(value)
      raise format("Illegal character \"%s\"", value) unless value.instance_of? String
      super("char",0)
      @value = value
    end

    def show
      return @value.to_s
    end
  end

  class Char_expression < Application
    def initialize(value)
      super(Char_symbol.new(value),[])
    end
    def show
      return @symbol.show
    end
    def ==(another_char)
      if another_char.class == Char_expression
        return self.symbol == another_char.symbol && self.symbol.value == another_char.symbol.value 
      end
    end
  end

  def CT_Character::make_char(x)
    return Box.new(CT_Character::Char_expression.new(x))
  end

end