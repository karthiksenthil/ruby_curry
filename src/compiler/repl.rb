require_relative './expressions.rb'

# function for backtracking the replacement stack
def backtrack(expr)

  $backtrack = true
  # $replacement_stack.pop() # pop the top-most element(main)
  main_element = $replacement_stack.last
  while(true)
    return false if $replacement_stack.empty?
    top = $replacement_stack.pop()
    redex_box = top[:redex_box]
    redex_content = top[:redex_content]
    contractum_content = top[:contractum_content]

    # undo the step

    redex_box.undo(redex_content)

    # if a Choice is found on stack, evaluate with right argument
    if redex_content.symbol.token == CHOICE
      if contractum_content == redex_content.arguments[0].content
        redex_box.replace(redex_content.arguments[1].content)
        return true
      end
    end
    
  end
end