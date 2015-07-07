require_relative '../../tests/test_new_compile.rb'

class Append_symbol < XSymbol
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
      inductive_arg2 = expr.content.arguments[1]

      case inductive_arg2.content.symbol.token
      when VARIABLE
            raise 'Handling Variables not implemented yet'
      when CHOICE
            raise 'Handling Choice not implemented yet'
      when OPERATION
            inductive_arg2.H()
            expr.H()
      when 3
        rhs = Box.new(Application.new($nil_list_symbol,[]))
        expr.replace(rhs.content)
      when 4
        rhs = Box.new(Application.new($cons_symbol,[expr.content.arguments[1].content.arguments[0],expr.content.arguments[1].content.arguments[1]]))
        expr.replace(rhs.content)
      end
    when 4
      rhs = Box.new(Application.new($cons_symbol,[expr.content.arguments[0].content.arguments[0],Box.new(Application.new($append_symbol,[expr.content.arguments[0].content.arguments[1],expr.content.arguments[1]]))]))
      expr.replace(rhs.content)
    end
    expr
  end
end #end of class

$append_symbol = Append_symbol.new('append',2,OPERATION)
