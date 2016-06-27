require_relative './CT_Expressions.rb'

module CT_Expressions

  class Box
    def ==(another_box)
      if another_box.class == CT_Expressions::Box
        return @content == another_box.content
      else
        return false
      end
    end
  end

  # two variables are always similar (independence of type?)
  class Variable < CT_Expressions::Expression
    def ==(another_var)
      if another_var.class == CT_Expressions::Variable
        return true
      else
        return false
      end
    end
  end

  class Application < CT_Expressions::Expression
    def ==(another_app)
      if another_app.class == CT_Expressions::Application
        return @symbol == another_app.symbol && 
               @arguments == another_app.arguments
      else
        return false
      end
    end
  end

end

# test case
append_sym = Operation.new("Test::CT_append",2)
append_sym2 = Operation.new("Test::CT_append2",2)
nil_sym = Constructor.new("Test::CT_nil",0)
nil_sym.token_value = 4
nil_app = CT_Expressions::Box.new(CT_Expressions::Application.new(nil_sym,[]))
append_app1 = CT_Expressions::Box.new(CT_Expressions::Application.new(append_sym,[nil_app,nil_app]))
append_app2 = CT_Expressions::Box.new(CT_Expressions::Application.new(append_sym2,[nil_app,nil_app]))
puts append_app1 == append_app2