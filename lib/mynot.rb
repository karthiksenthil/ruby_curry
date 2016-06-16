module Mynot

  require 'src/runtime/function_N.rb'
  require 'src/runtime/function_A.rb'
  require 'src/compiler/expressions.rb'
  require 'src/compiler/symbols.rb'
  require 'src/compiler/utilities.rb'
  require 'src/compiler/repl.rb'
  require 'System.rb'
  require 'integers.rb'
  require 'External.rb'

  require 'Prelude'

  Mynot::CT_myFalse = Constructor.new('Mynot::CT_myFalse',0)
  Mynot::CT_myFalse.token_value = 4
  Mynot::CT_myTrue = Constructor.new('Mynot::CT_myTrue',0)
  Mynot::CT_myTrue.token_value = 5

  Mynot::CT_myNot = Operation.new('Mynot::CT_myNot',1) # "myNot"
  Mynot::CT_main = Operation.new('Mynot::CT_main',0) # "main"

  def CT_myNot.H(expr) # "myNot"
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
      expr.replace(Box.new(Application.new(Default::CT_fail,[])).content)
    when 3 # OPERATION
      var2.H()
      expr.H()
    when 4 # "myFalse" => CT_myFalse
      rhs = Box.new(Application.new(Mynot::CT_myTrue,[]))
      expr.replace(rhs.content)
    when 5 # "myTrue" => CT_myTrue
      rhs = Box.new(Application.new(Mynot::CT_myFalse,[]))
      expr.replace(rhs.content)
    end
  end

  def CT_main.H(expr) # "main"
    rhs = Box.new(Application.new(Mynot::CT_myNot,[Box.new(Application.new(Mynot::CT_myNot,[Box.new(Application.new(Mynot::CT_myTrue,[]))]))]))
    expr.replace(rhs.content)
    expr.H()
  end

  repl(Box.new(Application.new(Mynot::CT_main,[])))

end
