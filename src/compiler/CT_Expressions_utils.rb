module CT_Expressions

  class Box

    def replace(new_content) # new content should be content of new Box object(contractum) only
      replace_record = {redex_box: self, redex_content: self.content, contractum_content: new_content}
      $replacement_stack.push(replace_record)
      Log.write(sprintf("R %s -> %s\n",@content.to_s,new_content.to_s)) if $trace
      @content = new_content
    end

    # the method to replace/undo steps during backtrack stage(no push to stack)
    def undo(new_content)
      Log.write(sprintf("U %s -> %s\n",self.to_s,new_content.to_s)) if $trace
      @content = new_content
    end

    def H
      # H is defined only for OPERATION and CHOICE symbols
      if @content.symbol.token != OPERATION && @content.symbol.token != CHOICE
        raise "H is not defined on a non-operation rooted expression"
      else
        @content.symbol.H(self)
      end
    end

  end

end