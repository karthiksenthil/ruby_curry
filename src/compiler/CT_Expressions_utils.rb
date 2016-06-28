require_relative './CT_Expressions.rb'

module CT_Expressions

  class Box

    def replace(new_content) # new content should be content of new Box object(contractum) only
      replace_record = {redex_box: self, redex_content: self.content, contractum_content: new_content}
      $replacement_stack.push(replace_record)
      Log.write(sprintf("R %s -> %s\n",@content.show,new_content.show)) if $trace
      @content = new_content
    end

  end

end