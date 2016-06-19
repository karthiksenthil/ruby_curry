require_relative '../compiler/symbols'

class Box
  def A
    case content.symbol.token
    when OPERATION
      raise 'Error, expression to A can only be constructor rooted'
    when VARIABLE
      # nothing to do
    when CHOICE
      raise 'Error, expression to A can only be constructor rooted'
    when FAIL
      # nothing to do
    else
      content.arguments.each do |arg|
        if arg.content.symbol.token == FAIL
          replace(arg.content)
          break
        end
      end                     
    end
    return self
  end
end
