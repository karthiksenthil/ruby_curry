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
$choose_rb_symbol = Operation.new('choose_rb',0,nil)
$choose_bg_symbol = Operation.new('choose_bg',0,nil)
$main_symbol = Operation.new('main',0,nil)



def $choose_rb_symbol.H(expr)
  # choice(red,blue)
  rhs = Box.new(Application.new($choice_symbol,[Box.new(Application.new($red_symbol,[])),Box.new(Application.new($blue_symbol,[]))]))
  expr.replace(rhs.content)
  expr
end




def $choose_bg_symbol.H(expr)
  # choice(blue,green)
  rhs = Box.new(Application.new($choice_symbol,[Box.new(Application.new($blue_symbol,[])),Box.new(Application.new($green_symbol,[]))]))
  expr.replace(rhs.content)
  expr
end




def $main_symbol.H(expr)
  # cons(choose_rb,cons(choose_bg,nil_list))
  rhs = Box.new(Application.new($cons_symbol,[Box.new(Application.new($choose_rb_symbol,[])),Box.new(Application.new($cons_symbol,[Box.new(Application.new($choose_bg_symbol,[])),Box.new(Application.new($nil_list_symbol,[]))]))]))
  expr.replace(rhs.content)
  expr
end


def main
  main_expr = Box.new(Application.new($main_symbol,[]))
  repl(main_expr)
end

main
