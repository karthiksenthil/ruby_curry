require_relative '../../examples/half.rb'

class Half_symbol < XSymbol
  def H(expr)
    inductive_arg1 = expr.content.arguments[0]

    case inductive_arg1.content.symbol.token
    when VARIABLE
        raise 'Handling Variables not implemented yet'
    when CHOICE
        raise 'Handling Choice not implemented yet'
    when OPERATION
        inductive_arg1.H()
        expr.H()
    when 3
      rhs = Box.new(Application.new($zero_symbol,[]))
      expr.replace(rhs.content)
    when 4
      inductive_arg2 = expr.content.arguments[0].content.arguments[0]

      case inductive_arg2.content.symbol.token
      when VARIABLE
            raise 'Handling Variables not implemented yet'
      when CHOICE
            raise 'Handling Choice not implemented yet'
      when OPERATION
            inductive_arg2.H()
            expr.H()
      when 3
        rhs = Box.new(Application.new($zero_symbol,[]))
        expr.replace(rhs.content)
      when 4
        rhs = Box.new(Application.new($s_symbol,[Box.new(Application.new($half_symbol,[expr.content.arguments[0].content.arguments[0].content.arguments[0]]))]))
        expr.replace(rhs.content)
      end
    end
    expr
  end
end #end of class

$half_symbol = Half_symbol.new('half',1,OPERATION)
