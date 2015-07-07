require_relative '../src/definitional_tree.rb'
require_relative '../src/utilities.rb'

class Branch < DefTreeNode

	def compile(indent=0)
		$inductive_var_counter += 1
		inductive_arg = "inductive_arg"+$inductive_var_counter.to_s
		output = print_spaces(indent)+inductive_arg+" = "
		# output += "expr.content.arguments["+($inductive_var_counter-1).to_s+"]\n\n"
		# find the localtion of the inductive variable in the pattern
		output += "expr"+build_using_path(self.pattern.content,self.variable.content)+"\n\n"
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
			# Important observation -> check leaf_with_variable_rhs.png
			# output is very similar to Branch :
			# 1. pattern = self.pattern
			# 2. inductive variable = self.expression i.e variable on rhs
			# 3. children are leaf nodes where
			#    a) pattern = replace inductive arg by constructor_expression (Doubt : can this be inductive_arg.replace(cons_expr))
			#    b) expression = constructor_expression 

			var_type = self.expression.content.type
			if var_type == "*"
				constructors = $constructors_hash.values.flatten
			else
				constructors = $constructors_hash[var_type]
			end

			leaves = []
			# building a leaf node for each constructor
			constructors.each do |constructor|
				constructor_args = []
				(1..constructor.arity).each do |i|
					constructor_args << make_variable("_v"+i.to_s,"temporary variable")
				end
				constructor_expression = Box.new(Application.new(constructor,constructor_args))

				replaced_args = self.pattern.content.arguments.map{|a|
					if a.content == self.expression.content
						constructor_expression
					else
						a
					end
				}

				lhs = Box.new(Application.new(self.pattern.content.symbol,replaced_args))
				rhs = constructor_expression
				leaves << Leaf.new(lhs,rhs)
			end

			pseudo_branch = Branch.new(self.pattern,self.expression,leaves)

			# pseudo_branch.pretty_print()
			output += pseudo_branch.compile(indent)


		when OPERATION
			# handle leaf case with operation-rooted expression on rhs
			# output -> expr.replace(rhs.H().content)
			rhs_operation = self.expression.content
			output += print_spaces(indent)+"rhs = "+rhs_operation.print_code(self.pattern.content)+"\n"
			output += print_spaces(indent)+"expr.replace(rhs.H().content)\n"
		else
			# handles leaf case with constructors on rhs
			rhs_constructor = self.expression.content
			# handle case when variables are present in args of rhs_constructor
			# pass the lhs_pattern of the leaf so that if variables are in rhs, they find their
			# location with respect to lhs_pattern
			output += print_spaces(indent)+"rhs = "+rhs_constructor.print_code(self.pattern.content)+"\n"
			output += print_spaces(indent)+"expr.replace(rhs.content)\n"
		end

		return output
	end

end

class Exempt < DefTreeNode

	def compile(indent=0)
		output = print_spaces(indent)+"raise('Exempt node encountered/Invalid expression')\n"
	end

end





$inductive_var_counter = 0
def main(def_tree)
	
	indent = 0
	operation_name = def_tree.pattern.content.symbol.show()
	output_file = File.new("/home/karthik/Documents/GSoC2015/PSU_stuff/definitional_trees/code/DefinitionalTree/tmp/new_compile_output/"+ operation_name +"_h.rb","w")
	# IMPORTANT : name of the file where definitional tree is defined should be examples/<operation_symbol>.rb
	# output_file.write("require_relative '../../examples/"+operation_name+".rb'\n\n")

	# alternatively, get name of file calling the new_compile main function
	calling_file = caller[0].split(":")[0]
	output_file.write("require_relative '../../"+calling_file+"'\n\n")	

	output_file.write("class "+operation_name.capitalize+"_symbol < XSymbol\n")
	output = print_spaces(indent+1)+"def H(expr)\n"
	output += def_tree.compile(indent+2)
	output += print_spaces(indent+2)+"expr\n"
	output += print_spaces(indent+1)+"end\n"
	output_file.write(output)
	output_file.write("end #end of class\n\n")
	# redefine the operation symbol
	output_file.write("$"+operation_name+"_symbol = "+operation_name.capitalize+"_symbol.new('"+operation_name+"',"+
		def_tree.pattern.content.symbol.arity.to_s+",OPERATION)\n")
	output_file.close
	# puts output

end