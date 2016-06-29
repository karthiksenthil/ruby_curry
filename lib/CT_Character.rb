module CT_Character
  require_relative '../src/compiler/expressions_include.rb'

  class Char_symbol < Constructor
    attr_accessor :name, :value, :arity, :token
    def initialize(value)
      raise format("Illegal character \"%s\"", value) unless value.instance_of? String
      super("char",0)
      @value = value
    end

    def to_s
      if (@value =~ /[^[:print:]]/).nil?
        return "\""+@value+"\""
      else
        return "\"\\x"+@value.ord.to_s(16)+"\""
      end
    end

    def ==(another_char)
    if another_char.class == Char_symbol
      return @value == another_char.value
    end
  end
  end

  class Char_expression < CT_Expressions::Application
    def initialize(value)
      super(Char_symbol.new(value),[])
    end
    def to_s
      return @symbol.to_s
    end
    def ==(another_char)
      if another_char.class == Char_expression
        return self.symbol == another_char.symbol && self.symbol.value == another_char.symbol.value 
      end
    end
  end

  def CT_Character::make_char(x)
    return CT_Expressions::Box.new(CT_Character::Char_expression.new(x))
  end

end