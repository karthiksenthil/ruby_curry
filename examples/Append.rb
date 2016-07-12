module Append

  require 'src/runtime/function_N.rb'
  require 'src/runtime/function_A.rb'
  require 'src/compiler/expressions_include.rb'
  require 'src/compiler/utilities.rb'
  require 'src/compiler/repl.rb'
  require 'CT_System.rb'
  require 'integers.rb'
  require 'CT_Character.rb'
  require 'CT_External.rb'

  require 'Prelude'

  Append::CT_append = CT_Symbols::Operation.new('Append::CT_append',2) # "append"
  Append::CT_main = CT_Symbols::Operation.new('Append::CT_main',0) # "main"

  def CT_append.H(expr) # "append"
    var1 = expr.content.arguments[0]
    var2 = expr.content.arguments[1]
    # var5 case selector
    var5 = var1
    loop {
      case var5.content.symbol.token
      when 0 # VARIABLE
        bind_variable(var5, CT_Expressions::Box.new(CT_Expressions::Application.new(CT_System::CT_choice,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[])),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[CT_Expressions::Box.new(CT_Expressions::make_variable),CT_Expressions::Box.new(CT_Expressions::make_variable)]))])))
        next
      when 1, 3 # CHOICE, OPERATION
        var5.H
        next
      when 2 # FAIL
        replacex(expr,CT_External::FAILED)
        return expr
      when 4 # "[]" => CT__5B_5D
        rhs = var2
        replacex(expr,rhs)
        if expr.content.symbol.token == CT_Symbols::OPERATION
          expr.H()
        end
        return expr
      when 5 # ":" => CT__3A
        var3 = var5.content.arguments[0]
        var4 = var5.content.arguments[1]
        rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[var3,CT_Expressions::Box.new(CT_Expressions::Application.new(Append::CT_append,[var4,var2]))]))
        replacex(expr,rhs)
        return expr
      end
    }
  end

  def CT_main.H(expr) # "main"
    rhs = CT_Expressions::Box.new(CT_Expressions::Application.new(Append::CT_append,[CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[make_int(1),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[make_int(2),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))])),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[make_int(3),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__3A,[make_int(4),CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT__5B_5D,[]))]))]))]))
    replacex(expr,rhs)
    expr.H()
    return expr
  end

  repl(CT_Expressions::Box.new(CT_Expressions::Application.new(Append::CT_main,[])))

end
