require_relative './expressions.rb'

# function for backtracking the replacement stack
def backtrack(expr)
  $replacement_stack.pop()
  loop do
    return false if $replacement_stack.empty?
    top = $replacement_stack.pop()
    redex = top[:old]
    contractum = top[:new]

    # logging backtrack
    Log.write(sprintf("U %s -> %s\n",redex.show,contractum.show)) if $trace

    # undo the step
    
    # find position of contractum in current expression
    contractum_path = expr.content.sub_expression_path(contractum)
    if contractum_path[0] == "found"
      contractum_path = []
    end

    # obtain the replacement code
    replace_code = build_contractum_replace(contractum_path)
    redex_replace_code = replace_code + "redex)"
    eval(redex_replace_code)

    # if a Choice is found on stack, evaluate with right argument
    if redex.symbol.token == CHOICE
      right_arg = redex.arguments[1].content
      choice_redex_replace_code = replace_code + "right_arg)"
      eval(choice_redex_replace_code)
      return true
    end
    
  end
end