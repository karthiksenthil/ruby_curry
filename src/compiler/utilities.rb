# some utility functions
require_relative './expressions.rb'

def print_spaces(n)
	return " "*2*n
end

# function to return the name of a variable, unsure how to use
def puti(symb, the_binding)
  var_name  = symb.to_s
  return var_name
end

# extend classes Application and Variable to print code and find path
class Application < Expression

	# parameter expression => lhs_pattern of a leaf (see Notes print_code 1.1)
	def print_code(expression)
		code = "Box.new(Application.new("
		# Doubt : should $ be appended to symbol
		code += "$"+self.symbol.show() + "_symbol,["
		code += self.arguments.map { |arg| arg.content.print_code(expression) }.join(",")
		code += "]))"
	end

	# method to identify position of variable in expression by builiding a path
	# check Notes find_path
	def find_path(variable)	
		path = []
		self.arguments.each do |arg|
			path << self.arguments.index(arg)+1
			inner_path = arg.content.find_path(variable)

			if inner_path.empty?
				path.pop
			elsif inner_path[0] == "found"
				return path
			else
				path += inner_path
			end

		end
		return path
	end

end

class Variable < Expression

	# to print code for a Variable, we find the path of the variable w.r.t an expression 
	def print_code(expression)
		code = "expr"+build_using_path(expression,self) 
	end

	# method to identify position of variable in expression by builiding a path
	# check Notes find_path
	def find_path(variable)		
		path = []
		if self == variable
			path << "found"
		end
		return path
	end

end

# method to retrieve a variable from reference expression
def build_using_path(expression,variable)
	path = expression.find_path(variable)
	output = ''
	path.each do |i|
		output += '.content.arguments['+(i-1).to_s+']' 
	end
	return output
end


=begin

################################ NOTES ################################

print_code
1.1) 
print_code is used in case "constructor-rooted rhs of leaf". While printing
the arguments of an Application, it can also be a Variable. print_code for
Variable requires a reference "expression" w.r.t which the Variable is found
and code is built to retrieve that Variable in input expr

In this case reference "expression" ==> lhs_pattern of the leaf


find_path
2.1) 
find_path finds the path to a Variable in an  expression
Example -
a)	expr = append(xs,ys)
  	expr.find_path(xs) ==> [1] ==> xs is first arg of expr

b)	expr = append(append(xs,ys),[])
  	expr.find_path(xs) ==> [1,1] ==> xs is first arg of the first arg of expr

2.2) 
find_path is specialised for Application & Variable, since each argument of
Application can be either of them.

2.3) Working : 
1. Loop through all arguments of expression
2. Push argument's index to path
3. Recursive call to find_path on argument
4. If empty --> Variable not present, pop the index
5. If found --> Varible found return path
6. Else --> Variable in nested expressions, add path
			


# method to identify position of variable in expression by path 
# this is old code for find_path with RTTI
def find_path(expression,variable)
	
	path = []
	expression.arguments.each do |arg|
		if arg.content.class == Variable
			if arg.content == variable
				path << expression.arguments.index(arg)+1
				return path
			end
		elsif arg.content.class == Application
			path << expression.arguments.index(arg)+1
			inner_path = find_path(arg.content,variable)
			if inner_path.empty?
				path.pop
			else
				path += inner_path
			end
		end
	end
	path

end

=end