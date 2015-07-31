require_relative './expressions.rb'
require_relative './exec_expressions.rb'


class Variable < Expression
	
	def pseudo_replace(var)
		if self.symbol == var.symbol
			return Box.new(H.new(make_variable(self.symbol.name,self.type)))
		else
			return Box.new(self)
		end
	end

end

class Application < Expression
	  
	def pseudo_replace(var)
		args = @arguments.map { |a| a.content.pseudo_replace(var)  }
		return Application.new(@symbol,args)
	end
 
end