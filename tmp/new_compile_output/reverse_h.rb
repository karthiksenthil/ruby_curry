require_relative '../../examples/naive_reverse.rb'

class Reverse_symbol < XSymbol
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
    when 3
      rhs = Box.new(Application.new($nil_list_symbol,[]))
      expr.replace(rhs.content)
    when 4
      rhs = Box.new(Application.new($append_symbol,[Box.new(Application.new($reverse_symbol,[expr.content.arguments[0].content.arguments[1]])),Box.new(Application.new($cons_symbol,[expr.content.arguments[0].content.arguments[0],Box.new(Application.new($nil_list_symbol,[]))]))]))
      expr.replace(rhs.H().content)
    end
    expr
  end
end #end of class

$reverse_symbol = Reverse_symbol.new('reverse',1,OPERATION)
