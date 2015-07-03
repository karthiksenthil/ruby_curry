require_relative '../src/definitional_tree.rb'

class Branch < DefTreeNode

	def compile
		$inductive_var_counter += 1
		inductive_arg = "inductive_arg"+$inductive_var_counter.to_s
		output = inductive_arg+" = "
		# here expr is not always the case, it's the outer most inductive variable
		output += "expr.content.arguments["+($inductive_var_counter-1).to_s+"]\n"
		output += 
"case "+inductive_arg+".content.symbol.token
when VARIABLE
	raise 'Handling Variables not implemented yet'
when CHOICE
	raise 'Handling Choice not implemented yet'
when OPERATION
	"+inductive_arg+".H()
	expr.H()
"

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
			"when "+constructors[i].token.to_s+"\n"
			output += self.children[i].compile()
		end		

		output += "end\n"
		return output

	end

end

class Leaf < DefTreeNode

	def compile
		output = ''

		case self.expression.content.symbol.token
		when VARIABLE 
			# handle leaf case with Variable on rhs
		when OPERATION
			# handle leaf case with operation-rooted expression on rhs
		else
			# handles leaf case with constructors on rhs
			rhs_constructor = self.expression.content
			output += "expr.replace(?)\n"
		end

		return output
	end

end






$inductive_var_counter = 0
def main(def_tree)
	output = "def H(expr)\n"
	output += def_tree.compile()
	output += "end\n"

	puts output
end