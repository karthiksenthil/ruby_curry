module CT_System

  # Some special symbols
  CT_System::CT_fail = Fail.new
  CT_System::CT_choice = Choice.new
  CT_System::CT_partial = Partial.new

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
      expr.replace(var1.content)
    when 2 # FAIL
      expr.replace(Box.new(Application.new(CT_System::CT_fail,[])).content)
    else
     expr.replace(var1.content)
    end      
  end

end
