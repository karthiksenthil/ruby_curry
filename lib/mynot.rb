
require 'src/runtime/function_N.rb'
require 'src/runtime/function_A.rb'
require 'src/compiler/expressions.rb'
require 'src/compiler/symbols.rb'
require 'src/compiler/utilities.rb'
require 'src/compiler/repl.rb'

#Object code for mynot module
$_ct_myFalse = Constructor.new('_ct_myFalse',0)
$_ct_myFalse.token_value = 4
$_ct_myTrue = Constructor.new('_ct_myTrue',0)
$_ct_myTrue.token_value = 5
$_ct_myNot = Operation.new('_ct_myNot',1,nil)
$_ct_main = Operation.new('_ct_main',0,nil)


#defining H function for _ct_myNot operation
def $_ct_myNot.H(expr)
  var1 = expr.content.arguments[0]
  #var2 is Unimplemented. Could be ICase, IBind, IFree
  var2 = var1
  case var2.content.symbol.token
  when 0 # VARIABLE
    raise 'Handling Variables not implemented yet'
  when 1 # CHOICE
    var2.H()
    expr.H()
  when 2 # FAIL
    expr.replace(Box.new(Application.new($_ct_fail,[])).content)
  when 3 # OPERATION
    var2.H()
    expr.H()
  when 4 # "myFalse" => _ct_myFalse
    rhs = Box.new(Application.new($_ct_myTrue,[]))
    expr.replace(rhs.content)
  when 5 # "myTrue" => _ct_myTrue
    rhs = Box.new(Application.new($_ct_myFalse,[]))
    expr.replace(rhs.content)
  end
end


#defining H function for _ct_main operation
def $_ct_main.H(expr)
  rhs = Box.new(Application.new($_ct_myNot,[Box.new(Application.new($_ct_myNot,[Box.new(Application.new($_ct_myTrue,[]))]))]))
  expr.replace(rhs.content)
  expr.H()
end

def main
  main_expr = Box.new(Application.new($_ct_main,[]))
  repl(main_expr)
end

main

#end of module
