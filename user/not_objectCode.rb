require_relative '../src/runtime/function_N.rb'
require_relative '../src/runtime/function_A.rb'
require_relative '../src/compiler/expressions.rb'
require_relative '../src/compiler/symbols.rb'
require_relative '../src/compiler/utilities.rb'
require_relative '../src/compiler/repl.rb'

$true_symbol = Constructor.new('true',0)
$true_symbol.token_value = 4
$false_symbol = Constructor.new('false',0)
$false_symbol.token_value = 5
$not_symbol = Operation.new('not',1,nil)
$main_symbol = Operation.new('main',0,nil)



def $not_symbol.H(expr)
  inductive_arg1 = expr.content.arguments[0]
  case inductive_arg1.content.symbol.token
  when VARIABLE
    raise 'Handling Variables not implemented yet'
  when CHOICE
    inductive_arg1.H()
    expr.H()
  when FAIL
    expr.replace($fail_expression.content)
  when OPERATION
    inductive_arg1.H()
    expr.H()
  when 4  #true
    # false
    rhs = Box.new(Application.new($false_symbol,[]))
    expr.replace(rhs.content)
  when 5  #false
    # true
    rhs = Box.new(Application.new($true_symbol,[]))
    expr.replace(rhs.content)
  end
  expr
end




def $main_symbol.H(expr)
  # not(not(true))
  rhs = Box.new(Application.new($not_symbol,[Box.new(Application.new($not_symbol,[Box.new(Application.new($true_symbol,[]))]))]))
  expr.replace(rhs.content)
  expr.H()
  expr
end


def main
  main_expr = Box.new(Application.new($main_symbol,[]))
  repl(main_expr)
end

main
