require_relative '../src/runtime/function_N.rb'
require_relative '../src/runtime/function_A.rb'
require_relative '../src/compiler/expressions.rb'
require_relative '../src/compiler/symbols.rb'
require_relative '../src/compiler/utilities.rb'
require_relative '../src/compiler/repl.rb'

#Choice symbol and H function defined are globally defined in symbols.rb
$nil_list_symbol = Constructor.new('nil_list',0)
$nil_list_symbol.token_value = 4
$cons_symbol = Constructor.new('cons',2)
$cons_symbol.token_value = 5
$red_symbol = Constructor.new('red',0)
$red_symbol.token_value = 4
$green_symbol = Constructor.new('green',0)
$green_symbol.token_value = 5
$blue_symbol = Constructor.new('blue',0)
$blue_symbol.token_value = 6
$ndinsert_symbol = Operation.new('ndinsert',2,nil)
$permute_symbol = Operation.new('permute',1,nil)
$main_symbol = Operation.new('main',0,nil)



def $ndinsert_symbol.H(expr)
  inductive_arg1 = expr.content.arguments[1]
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
  when 4  #nil_list
    # cons(x,nil_list)
    rhs = Box.new(Application.new($cons_symbol,[expr.content.arguments[0],Box.new(Application.new($nil_list_symbol,[]))]))
    expr.replace(rhs.content)
  when 5  #cons
    # choice(cons(x,cons(y,ys)),cons(y,ndinsert(x,ys)))
    rhs = Box.new(Application.new($choice_symbol,[Box.new(Application.new($cons_symbol,[expr.content.arguments[0],Box.new(Application.new($cons_symbol,[expr.content.arguments[1].content.arguments[0],expr.content.arguments[1].content.arguments[1]]))])),Box.new(Application.new($cons_symbol,[expr.content.arguments[1].content.arguments[0],Box.new(Application.new($ndinsert_symbol,[expr.content.arguments[0],expr.content.arguments[1].content.arguments[1]]))]))]))
    expr.replace(rhs.content)
  end
  expr
end




def $permute_symbol.H(expr)
  inductive_arg2 = expr.content.arguments[0]
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
  when 4  #nil_list
    # nil_list
    rhs = Box.new(Application.new($nil_list_symbol,[]))
    expr.replace(rhs.content)
  when 5  #cons
    # ndinsert(x,permute(xs))
    rhs = Box.new(Application.new($ndinsert_symbol,[expr.content.arguments[0].content.arguments[0],Box.new(Application.new($permute_symbol,[expr.content.arguments[0].content.arguments[1]]))]))
    expr.replace(rhs.content)
    expr.H()
  end
  expr
end




def $main_symbol.H(expr)
  # permute(cons(red,cons(green,nil_list)))
  rhs = Box.new(Application.new($permute_symbol,[Box.new(Application.new($cons_symbol,[Box.new(Application.new($red_symbol,[])),Box.new(Application.new($cons_symbol,[Box.new(Application.new($green_symbol,[])),Box.new(Application.new($nil_list_symbol,[]))]))]))]))
  expr.replace(rhs.content)
  expr.H()
  expr
end


def main
  main_expr = Box.new(Application.new($main_symbol,[]))
  repl(main_expr)
end

main
