require_relative '../src/runtime/function_N.rb'
require_relative '../src/runtime/function_A.rb'
require_relative '../src/compiler/expressions.rb'
require_relative '../src/compiler/symbols.rb'
require_relative '../src/compiler/utilities.rb'
require_relative '../src/compiler/repl.rb'

$zero_symbol = Constructor.new('zero',0)
$zero_symbol.token_value = 4
$succ_symbol = Constructor.new('succ',1)
$succ_symbol.token_value = 5
$true_symbol = Constructor.new('true',0)
$true_symbol.token_value = 4
$false_symbol = Constructor.new('false',0)
$false_symbol.token_value = 5
$leq_symbol = Operation.new('leq',2,nil)
$main_symbol = Operation.new('main',0,nil)



def $leq_symbol.H(expr)
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
  when 4  #zero
    # true
    rhs = Box.new(Application.new($true_symbol,[]))
    expr.replace(rhs.content)
  when 5  #succ
    inductive_arg2 = expr.content.arguments[1]
    case inductive_arg2.content.symbol.token
    when VARIABLE
      raise 'Handling Variables not implemented yet'
    when CHOICE
      inductive_arg2.H()
      expr.H()
    when FAIL
      expr.replace($fail_expression.content)
    when OPERATION
      inductive_arg2.H()
      expr.H()
    when 4  #zero
      # false
      rhs = Box.new(Application.new($false_symbol,[]))
      expr.replace(rhs.content)
    when 5  #succ
      # leq(y,x)
      rhs = Box.new(Application.new($leq_symbol,[expr.content.arguments[0].content.arguments[0],expr.content.arguments[1].content.arguments[0]]))
      expr.replace(rhs.content)
      expr.H()
    end
  end
  expr
end




def $main_symbol.H(expr)
  # leq(succ(succ(zero)),succ(succ(zero)))
  rhs = Box.new(Application.new($leq_symbol,[Box.new(Application.new($succ_symbol,[Box.new(Application.new($succ_symbol,[Box.new(Application.new($zero_symbol,[]))]))])),Box.new(Application.new($succ_symbol,[Box.new(Application.new($succ_symbol,[Box.new(Application.new($zero_symbol,[]))]))]))]))
  expr.replace(rhs.content)
  expr.H()
  expr
end


def main
  main_expr = Box.new(Application.new($main_symbol,[]))
  repl(main_expr)
end

main
