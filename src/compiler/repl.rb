require 'optparse'
require_relative './expressions.rb'

# function for setting flags for runtime trace
def set_execution_trace
  option = false
  OptionParser.new do |opts|
    opts.on("-t", "--trace") do |v|
      option = true
    end
  end.parse!
  return option
end

# function for backtracking the replacement stack
def backtrack(expr)

  # $backtrack = true # culprit of the issue
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

  # set global flags
  $trace = set_execution_trace()

  # starting computation
  Log.write(sprintf("A %s\n",top_level.show)) if $trace

  loop do 
    # report looping
    Log.write(sprintf("L %s\n",top_level.show)) if $trace
    top_level.N()

    if top_level.content.symbol.token == FAIL
      # report failure
      Log.write(sprintf("F \n")) if $trace
      # Do not print failures
    else
      # either trace or print value  
      if $trace
        Log.write(sprintf("V %s\n",top_level.show))
      else
        # print value unless tracing
        printf("%s\n", top_level.show)
      end
      # print_stack
    end

    break if !backtrack(top_level)

  end

  # done with all computations
  Log.write(sprintf("Z \n")) if $trace

end
