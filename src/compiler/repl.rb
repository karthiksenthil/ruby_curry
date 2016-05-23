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


# function to implement the overall REPL operation for object-code
# Param : top_level -> top level expression to evaluate in object code
def repl(top_level)

  # starting computation
  Log.write(sprintf("A %s\n",top_level.show)) if $trace

  loop do 
    # report looping
    Log.write(sprintf("L %s\n",top_level.show)) if $trace
    top_level.N()

    if top_level.content == $fail_expression
      # report failure
      Log.write(sprintf("F \n")) if $trace
      # add fail expression as output
      $output_expressions << $fail_expression.show()
    else
      # report value
      Log.write(sprintf("V %s\n",top_level.show)) if $trace
      # add the value as output
      $output_expressions << top_level.show()
      # print_stack
    end

    break if !backtrack(top_level)

  end

  # done with all computations
  Log.write(sprintf("Z \n")) if $trace
end