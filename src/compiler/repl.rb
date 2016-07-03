require 'optparse'
require_relative './expressions_include.rb'

# a structure to trace each and every replacement
# structure of stack element :
# {box_of_redex, content_of_redex, content_of_contractum}
$replacement_stack = [] 

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

def help
  printf("A: start computation\n")
  printf("F: failure\n")
  printf("L: looping\n")
  printf("R: replace\n")
  printf("U: undo replacement\n")
  printf("V: value\n")
  printf("Z: end computation\n")
  printf("--------------------------------\n")
end

# both arguments are boxes, though the contractum needs not to be
def replacex(redex, contractum) 
  before = redex.content
  after  = contractum.content
  replace_record = {redex_box: redex, redex_content: before, contractum_content: after}
  $replacement_stack.push(replace_record)
  Log.write(sprintf("R %s -> %s\n",before.to_s,after.to_s)) if $trace
  redex.content = after
end

# function for backtracking the replacement stack
def backtrack(expr)

  while(true)
    return false if $replacement_stack.empty?
    top = $replacement_stack.pop()
    redex_box = top[:redex_box]
    redex_content = top[:redex_content]
    contractum_content = top[:contractum_content]

    # undo the step
    Log.write(sprintf("U %s -> %s\n",redex_box.to_s,redex_content.to_s)) if $trace
    redex_box.content = redex_content

    # if a Choice is found on stack, and it was reduced to the left argument
    # reduce it to the right argument
    if redex_content.symbol.token == CT_Symbols::CHOICE
      if contractum_content.equal?(redex_content.arguments[0].content)
        replacex(redex_box,redex_content.arguments[1])
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
  help if $trace

  # starting computation
  Log.write(sprintf("A %s\n",top_level.to_s)) if $trace

  loop do 
    # report looping
    Log.write(sprintf("L %s\n",top_level.to_s)) if $trace
    top_level.N()

    if top_level.content.symbol.token == CT_Symbols::FAIL
      # report failure
      Log.write(sprintf("F \n")) if $trace
    # Do not print failures
    else
      # either trace or print value  
      if $trace
        Log.write(sprintf("V %s\n",top_level.to_s))
      else
        # print value unless tracing
        printf("%s\n", top_level.to_s)
      end
      # print_stack
    end

    break if !backtrack(top_level)

  end

  # done with all computations
  Log.write(sprintf("Z \n")) if $trace

end

