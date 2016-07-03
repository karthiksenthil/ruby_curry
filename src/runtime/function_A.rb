require_relative '../compiler/CT_Symbols'
require_relative '../compiler/expressions_include'

module CT_Expressions
  class Box
    def A
      case content.symbol.token
      when CT_Symbols::OPERATION
        raise 'Error, expression to A can only be constructor rooted'
      when CT_Symbols::VARIABLE
        # nothing to do
      when CT_Symbols::CHOICE
        raise 'Error, expression to A can only be constructor rooted'
      when CT_Symbols::FAIL
        # nothing to do
      else
        content.arguments.each do |arg|
          if arg.content.symbol.token == CT_Symbols::FAIL
            replacex(self,arg)
            break
          end
        end                     
      end
      return self
    end
  end
end
