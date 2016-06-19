require_relative '../compiler/symbols'
require_relative './function_A.rb'

class Box
  def N
    case content.symbol.token
    when VARIABLE
      raise 'Variable not implemented'
    when CHOICE, OPERATION
      H()
      N()
    when FAIL
      # nothing to do
    else
      content.arguments.each do |arg|
	      arg.N()
      end
      A()
    end
    return self
  end
end
