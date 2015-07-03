require_relative '../src/definitional_tree.rb'
require_relative '../src/utilities.rb'

class Branch < DefTreeNode

	def compile(indent=0)
		$inductive_var_counter += 1
		inductive_arg = "inductive_arg"+$inductive_var_counter.to_s
		output = print_spaces(indent)+inductive_arg+" = "
		# here expr is not always the case, it's the outer most inductive variable
		output += "expr.content.arguments["+($inductive_var_counter-1).to_s+"]\n\n"
		output += 
print_spaces(indent)+"case "+inductive_arg+".content.symbol.token\n"+
print_spaces(indent)+"when VARIABLE\n"+
print_spaces(indent)*2+"raise 'Handling Variables not implemented yet'\n"+
print_spaces(indent)+"when CHOICE\n"+
print_spaces(indent)*2+"raise 'Handling Choice not implemented yet'\n"+
print_spaces(indent)+"when OPERATION\n"+
print_spaces(indent)*2+inductive_arg+".H()\n"+
print_spaces(indent)*2+"expr.H()\n"


		var_type = self.variable.content.type
		if var_type=="*" # include all the constructors for a Variable of any type
			constructors = $constructors_hash.values.flatten
		else
			constructors = $constructors_hash[var_type]
		end

		# will it always work ? i.e is constructors.length == children.length ?
		# also ordering of constructors in the $constructors_hash is imp.
		(0..constructors.length-1).each do |i|
			output +=
			print_spaces(indent)+"when "+constructors[i].token.to_s+"\n"
			output += self.children[i].compile(indent+1)
		end		

		output += print_spaces(indent)+"end\n"
		return output

	end

end

class Leaf < DefTreeNode

	def compile(indent=0)
		output = ''

		case self.expression.content.symbol.token
		when VARIABLE 
			# handle leaf case with Variable on rhs
		when OPERATION
			# handle leaf case with operation-rooted expression on rhs
		else
			# handles leaf case with constructors on rhs
			rhs_constructor = self.expression.content
			# handle case when variables are present in args of rhs_constructor
			output += print_spaces(indent)+"expr.replace("+rhs_constructor.print_code()+")\n"
		end

		return output
	end

end






$inductive_var_counter = 0
def main(def_tree)
	indent = 0
	output = "def H(expr)\n"
	output += def_tree.compile(indent+1)
	output += "end\n"

	puts output
end