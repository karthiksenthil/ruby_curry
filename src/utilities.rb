# some utility functions

def print_spaces(n)
	return " "*2*n
end

# function to return the name of a variable, unsure how to use
def puti(symb, the_binding)
  var_name  = symb.to_s
  return var_name
end

# extend classes Application and Variable to print their corresponding code
class Application < Expression

	def print_code
		code = "Box.new(Application.new("
		code += self.symbol.show() + "_symbol,["

		self.arguments.each do |arg|
			code += arg.content.print_code()
		end

		code += "]))"
	end

end

class Variable < Expression

	# might not be needed, or needs change based on find_path
	def print_code
		code = "make_variable("
		code += self.symbol.show()+","
		code += self.type + ")" 
	end

end