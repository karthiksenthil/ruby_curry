require_relative '../../examples/arithmetic_expr_replace_refactored.rb'

class Arithmetic_replace_symbol < XSymbol
  def H(expr)
    inductive_arg1 = expr.content.arguments[1]

    case inductive_arg1.content.symbol.token
    when VARIABLE
      raise 'Handling Variables not implemented yet'
    when CHOICE
      raise 'Handling Choice not implemented yet'
    when FAIL
      expr.replace($fail_expression.content)
    when OPERATION
      inductive_arg1.H()
      expr.H()
    when 6
      inductive_arg2 = expr.content.arguments[2]

      case inductive_arg2.content.symbol.token
      when VARIABLE
        raise 'Handling Variables not implemented yet'
      when CHOICE
        raise 'Handling Choice not implemented yet'
      when FAIL
        expr.replace($fail_expression.content)
      when OPERATION
        inductive_arg2.H()
        expr.H()
      when 11
        rhs = Box.new(Application.new($lit_symbol,[expr.content.arguments[2].content.arguments[0]]))
        expr.replace(rhs.content)
      when 12
        rhs = Box.new(Application.new($var_symbol,[expr.content.arguments[2].content.arguments[0]]))
        expr.replace(rhs.content)
      when 4
        rhs = Box.new(Application.new($add_symbol,[expr.content.arguments[2].content.arguments[0],expr.content.arguments[2].content.arguments[1]]))
        expr.replace(rhs.content)
      when 5
        rhs = Box.new(Application.new($mul_symbol,[expr.content.arguments[2].content.arguments[0],expr.content.arguments[2].content.arguments[1]]))
        expr.replace(rhs.content)
      end
    when 7
      inductive_arg3 = expr.content.arguments[0]

      case inductive_arg3.content.symbol.token
      when VARIABLE
        raise 'Handling Variables not implemented yet'
      when CHOICE
        raise 'Handling Choice not implemented yet'
      when FAIL
        expr.replace($fail_expression.content)
      when OPERATION
        inductive_arg3.H()
        expr.H()
      when 11
        expr.replace($fail_expression.content)
      when 12
        expr.replace($fail_expression.content)
      when 4
        inductive_arg4 = expr.content.arguments[1].content.arguments[0]

        case inductive_arg4.content.symbol.token
        when VARIABLE
          raise 'Handling Variables not implemented yet'
        when CHOICE
          raise 'Handling Choice not implemented yet'
        when FAIL
          expr.replace($fail_expression.content)
        when OPERATION
          inductive_arg4.H()
          expr.H()
        when 8
          rhs = Box.new(Application.new($add_symbol,[Box.new(Application.new($arithmetic_replace_symbol,[expr.content.arguments[0].content.arguments[0],expr.content.arguments[1].content.arguments[1],expr.content.arguments[2]])),expr.content.arguments[0].content.arguments[1]]))
          expr.replace(rhs.content)
        when 9
          rhs = Box.new(Application.new($add_symbol,[expr.content.arguments[0].content.arguments[0],Box.new(Application.new($arithmetic_replace_symbol,[expr.content.arguments[0].content.arguments[1],expr.content.arguments[1].content.arguments[1],expr.content.arguments[2]]))]))
          expr.replace(rhs.content)
        when 13
          expr.replace($fail_expression.content)
        end
      when 5
        inductive_arg5 = expr.content.arguments[1].content.arguments[0]

        case inductive_arg5.content.symbol.token
        when VARIABLE
          raise 'Handling Variables not implemented yet'
        when CHOICE
          raise 'Handling Choice not implemented yet'
        when FAIL
          expr.replace($fail_expression.content)
        when OPERATION
          inductive_arg5.H()
          expr.H()
        when 8
          rhs = Box.new(Application.new($mul_symbol,[Box.new(Application.new($arithmetic_replace_symbol,[expr.content.arguments[0].content.arguments[0],expr.content.arguments[1].content.arguments[1],expr.content.arguments[2]])),expr.content.arguments[0].content.arguments[1]]))
          expr.replace(rhs.content)
        when 9
          rhs = Box.new(Application.new($mul_symbol,[expr.content.arguments[0].content.arguments[0],Box.new(Application.new($arithmetic_replace_symbol,[expr.content.arguments[0].content.arguments[1],expr.content.arguments[1].content.arguments[1],expr.content.arguments[2]]))]))
          expr.replace(rhs.content)
        when 13
          expr.replace($fail_expression.content)
        end
      end
    end
    expr
  end
end #end of class

$arithmetic_replace_symbol = Arithmetic_replace_symbol.new('arithmetic_replace',3,OPERATION)
