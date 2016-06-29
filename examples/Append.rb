module Append

  require 'src/runtime/function_N.rb'
  require 'src/runtime/function_A.rb'
  require 'src/compiler/expressions_include.rb'
  require 'src/compiler/symbols.rb'
  require 'src/compiler/utilities.rb'
  require 'src/compiler/repl.rb'
  require 'CT_System.rb'
  require 'integers.rb'
  require 'CT_Character.rb'
  require 'CT_External.rb'

  require 'Prelude'

  Append::CT_append = Operation.new('Append::CT_append',2) # "append"
  Append::CT_main = Operation.new('Append::CT_main',0) # "main"

  def CT_append.H(expr) # "append"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var1
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        raise 'Handling Variables not implemented yet'
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        expr.replace(CT_External::FAILED.content)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = var2
        expr.replace(rhs.content)
        if expr.content.symbol.token == OPERATION
          expr.H()
        end
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var3, CT_Expressions::Box.new(CT_Expressions::Application.new(Append::CT_append,[var4, var2]))]))
        expr.replace(rhs.content)
        return expr
      end
    }
  end

  def CT_main.H(expr) # "main"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Append::CT_append,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[make_int(1), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[make_int(2), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))])), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[make_int(3), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[make_int(4), CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))]))]))
    expr.replace(rhs.content)
    expr.H()
    return expr
  end

  repl(CT_Expressions::Box.new(CT_Expressions::Application.new(Append::CT_main,[])))

end
