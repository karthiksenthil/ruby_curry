module CT_System

  require 'src/compiler/expressions_include'

  # Some special symbols
  CT_System::CT_fail = CT_Symbols::Fail.new
  CT_System::CT_choice = CT_Symbols::Choice.new
  CT_System::CT_partial = CT_Symbols::Partial.new

  # Choice is an operation, hence must have an H function.
  def CT_choice.H(expr)
    # return the head normal form of the first argument
    var1 = expr.content.arguments[0]
    # p expr.show()
    # p var1.show()
    case var1.content.symbol.token
    when 0 # VARIABLE
      raise 'Handling Variables not implemented yet'
    when 1, 3 # CHOICE, OPERATION
      var1.H()
      replacex(expr,var1)
    when 2 # FAIL
      replacex(expr,CT_Expressions::Box.new(CT_Expressions::Application.new(Prelude::CT_failed,[])))
    else
     replacex(expr,var1)
    end
  end

end
