require_relative '../../examples/last_element_list.rb'

class Last_symbol < XSymbol
  def H(expr)
    rhs = Box.new(Application.new($condition_symbol,[Box.new(Application.new($constrained_equal_symbol,[Box.new(Application.new($append_symbol,[expr.content.arguments[0],Box.new(Application.new($cons_symbol,[expr,Box.new(Application.new($nil_list_symbol,[]))]))])),expr.content.arguments[0]])),expr]))
    expr.replace(rhs.H().content)
    expr
  end
end #end of class

$last_symbol = Last_symbol.new('last',1,OPERATION)
