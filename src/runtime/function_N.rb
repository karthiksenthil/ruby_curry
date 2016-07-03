require_relative '../compiler/CT_Symbols'
require_relative './function_A.rb'

module CT_Expressions

  class Box
    def N
      case content.symbol.token
      when CT_Symbols::VARIABLE
        raise 'Variable not implemented'
      when CT_Symbols::CHOICE, CT_Symbols::OPERATION
        H()
        N()
      when CT_Symbols::FAIL
        # nothing to do
      else
        content.arguments.each do |arg|
  	      arg.N()
        end
        A()
      end
      return self
    end
  end
  
end
