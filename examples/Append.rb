module Append

  require 'src/runtime/function_N.rb'
  require 'src/runtime/function_A.rb'
  require 'src/compiler/expressions.rb'
  require 'src/compiler/symbols.rb'
  require 'src/compiler/utilities.rb'
  require 'src/compiler/repl.rb'
  require 'CT_System.rb'
  require 'integers.rb'
  require 'CT_External.rb'

  require 'Prelude'

  Append::CT_append = Operation.new('Append::CT_append',2) # "append"
  Append::CT_main = Operation.new('Append::CT_main',0) # "main"

  def CT_append.H(expr) # "append"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    #var5 is Unimplemented. Could be ICase, IBind, IFree
    var5 = var1
    case var5.content.symbol.token
    when 0 # VARIABLE
      raise 'Handling Variables not implemented yet'
    when 1 # CHOICE
      var5.H()
      expr.H()
    when 2 # FAIL
      expr.replace(Box.new(Application.new(Prelude::CT_failed,[])).content)
    when 3 # OPERATION
      var5.H()
      expr.H()
    when 4 # "[]" => CT__5B_5D
      rhs = var2
      expr.replace(rhs.content)
      if expr.content.symbol.token == OPERATION
        expr.H()
      end
    when 5 # ":" => CT__3A
      var3 = var5.content.arguments[0]
      var4 = var5.content.arguments[1]
      rhs = Box.new(Application.new(Prelude::CT__3A,[var3, Box.new(Application.new(Append::CT_append,[var4, var2]))]))
      expr.replace(rhs.content)
    end
  end

  def CT_main.H(expr) # "main"
    rhs = Box.new(Application.new(Append::CT_append,[Box.new(Application.new(Prelude::CT__3A,[make_int(1), Box.new(Application.new(Prelude::CT__3A,[make_int(2), Box.new(Application.new(Prelude::CT__5B_5D,[]))]))])), Box.new(Application.new(Prelude::CT__3A,[make_int(3), Box.new(Application.new(Prelude::CT__3A,[make_int(4), Box.new(Application.new(Prelude::CT__5B_5D,[]))]))]))]))
    expr.replace(rhs.content)
    expr.H()
  end

  repl(Box.new(Application.new(Append::CT_main,[])))

end
