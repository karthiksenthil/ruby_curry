require_relative '../src/runtime/function_N.rb'
require_relative '../src/runtime/function_A.rb'
require_relative '../src/compiler/expressions.rb'
require_relative '../src/compiler/symbols.rb'
require_relative './reverse.rb'

$nil_list_symbol.token_value = 4
$cons_symbol.token_value = 5
$red_symbol.token_value = 4
$green_symbol.token_value = 5
$blue_symbol.token_value = 6



def $append_symbol.H(expr)
  inductive_arg1 = expr.content.arguments[0]
  case inductive_arg1.content.symbol.token
  when VARIABLE
    raise 'Handling Variables not implemented yet'
  when CHOICE
    raise 'Handling Choices not implemented yet'
  when FAIL
    expr.replace($fail_expression.content)
  when OPERATION
    inductive_arg1.H()
    expr.H()
  when 4  #nil_list
    inductive_arg2 = expr.content.arguments[1]
    case inductive_arg2.content.symbol.token
    when VARIABLE
      raise 'Handling Variables not implemented yet'
    when CHOICE
      raise 'Handling Choices not implemented yet'
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
      # cons(_v1,_v2)
      rhs = Box.new(Application.new($cons_symbol,[expr.content.arguments[1].content.arguments[0],expr.content.arguments[1].content.arguments[1]]))
      expr.replace(rhs.content)
    end
  when 5  #cons
    # cons(z,append(zs,ys))
    rhs = Box.new(Application.new($cons_symbol,[expr.content.arguments[0].content.arguments[0],Box.new(Application.new($append_symbol,[expr.content.arguments[0].content.arguments[1],expr.content.arguments[1]]))]))
    expr.replace(rhs.content)
  end
  expr
end




def $reverse_symbol.H(expr)
  inductive_arg3 = expr.content.arguments[0]
  case inductive_arg3.content.symbol.token
  when VARIABLE
    raise 'Handling Variables not implemented yet'
  when CHOICE
    raise 'Handling Choices not implemented yet'
  when FAIL
    expr.replace($fail_expression.content)
  when OPERATION
    inductive_arg3.H()
    expr.H()
  when 4  #nil_list
    # nil_list
    rhs = Box.new(Application.new($nil_list_symbol,[]))
    expr.replace(rhs.content)
  when 5  #cons
    # append(reverse(xs),cons(x,nil_list))
    rhs = Box.new(Application.new($append_symbol,[Box.new(Application.new($reverse_symbol,[expr.content.arguments[0].content.arguments[1]])),Box.new(Application.new($cons_symbol,[expr.content.arguments[0].content.arguments[0],Box.new(Application.new($nil_list_symbol,[]))]))]))
    expr.replace(rhs.H().content)
  end
  expr
end




def $main_symbol.H(expr)
  # reverse(append(append(cons(red,nil_list),cons(green,nil_list)),cons(blue,nil_list)))
  rhs = Box.new(Application.new($reverse_symbol,[Box.new(Application.new($append_symbol,[Box.new(Application.new($append_symbol,[Box.new(Application.new($cons_symbol,[Box.new(Application.new($red_symbol,[])),Box.new(Application.new($nil_list_symbol,[]))])),Box.new(Application.new($cons_symbol,[Box.new(Application.new($green_symbol,[])),Box.new(Application.new($nil_list_symbol,[]))]))])),Box.new(Application.new($cons_symbol,[Box.new(Application.new($blue_symbol,[])),Box.new(Application.new($nil_list_symbol,[]))]))]))]))
  expr.replace(rhs.H().content)
  expr
end


def main
  main_expr = Box.new(Application.new($main_symbol,[]))
  main_expr.N()
end
