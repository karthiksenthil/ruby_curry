require_relative '../src/runtime/function_N.rb'
require_relative '../src/runtime/function_A.rb'
require_relative '../src/compiler/expressions.rb'
require_relative '../src/compiler/symbols.rb'
require_relative '../src/compiler/utilities.rb'
require_relative './or.rb'

$true_symbol.token_value = 4
$false_symbol.token_value = 5



def $or_symbol.H(expr)
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
    # true
    rhs = Box.new(Application.new($true_symbol,[]))
    expr.replace(rhs.content)
  when 5  #false
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
    when 4  #true
      # true
      rhs = Box.new(Application.new($true_symbol,[]))
      expr.replace(rhs.content)
    when 5  #false
      # false
      rhs = Box.new(Application.new($false_symbol,[]))
      expr.replace(rhs.content)
    end
  end
  expr
end




def $main_symbol.H(expr)
  # or(false,choice(true,false))
  rhs = Box.new(Application.new($or_symbol,[Box.new(Application.new($false_symbol,[])),Box.new(Application.new($choice_symbol,[Box.new(Application.new($true_symbol,[])),Box.new(Application.new($false_symbol,[]))]))]))
  expr.replace(rhs.H().content)
  expr
end


def main
  main_expr = Box.new(Application.new($main_symbol,[]))
  main_expr.N()
end
