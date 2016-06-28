module CT_Expressions

  class Box
    def to_s
      @content.to_s()
    end
  end

  class Variable < CT_Expressions::Expression
    def to_s
      return @symbol.to_s()
    end
  end

  class Application < CT_Expressions::Expression
    def to_s
      output = @symbol.to_s()+"("
      if !@arguments.nil?
        @arguments.each do |arg|
      output += arg.to_s()+","
        end
      end
      
      if output[-1] == ',' # to remove the last comma
        output[-1] = ''
        output += ")"
      elsif output[-1] == '(' # case to remove '(' if Application has no arguments
        output[-1] = ''
      end
      
      return output
    end
  end

end

=begin
# test case
append_sym = Operation.new("Test::CT_append",2)
nil_sym = Constructor.new("Test::CT_nil",0)
nil_sym.token_value = 4
nil_app = CT_Expressions::Box.new(CT_Expressions::Application.new(nil_sym,[]))
append_app = CT_Expressions::Box.new(CT_Expressions::Application.new(append_sym,[nil_app,nil_app]))
puts append_app.to_s
puts append_app.class
=end