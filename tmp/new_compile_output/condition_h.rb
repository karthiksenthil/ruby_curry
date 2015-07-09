require_relative '../../examples/last_element_list.rb'

class Condition_symbol < XSymbol
  def H(expr)
    inductive_arg3 = expr.content.arguments[0]

    case inductive_arg3.content.symbol.token
    when VARIABLE
        raise 'Handling Variables not implemented yet'
    when CHOICE
        raise 'Handling Choice not implemented yet'
    when OPERATION
        inductive_arg3.H()
        expr.H()
    when 5
      inductive_arg4 = expr.content.arguments[1]

      case inductive_arg4.content.symbol.token
      when VARIABLE
            raise 'Handling Variables not implemented yet'
      when CHOICE
            raise 'Handling Choice not implemented yet'
      when OPERATION
            inductive_arg4.H()
            expr.H()
      when 5
        rhs = Box.new(Application.new($success_symbol,[]))
        expr.replace(rhs.content)
      end
    end
    expr
  end
end #end of class

$condition_symbol = Condition_symbol.new('condition',2,OPERATION)
