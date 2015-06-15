require_relative './definitional_tree.rb'
require_relative './replace.rb'

# extending the Application and Variable classes for compile procedure
# to handle the Leaf node case

class Application < Expression

	def generate_H(lhs_pattern)
		output = 'H(' + lhs_pattern.show() + ') = '

		# identify the leading symbol of RHS 
		leading_symbol = self.symbol
		if leading_symbol.kind == :oper # case 2.1 i.e operator rooted
			output += 'H(' + self.show() + ')'
		elsif leading_symbol.kind == :ctor # case 2.2 i.e constructor rooted
			output += self.show()
		end

		return output
	end

end

class Variable < Expression

	def generate_H(lhs_pattern)
		var_type = "list" # hard-coded for the case of append.rb, alt -> rule_rhs.type ?
		output = ''
		constructors = $constructors_hash[var_type]

		# l_prime -> r_prime where r_prime is expr when r is replaced by a constructor
		if !constructors.nil?
			constructors.each do |constructor|
				replaced_args = lhs_pattern.arguments.map{ |a|
					if a == self
						constructor
					else
						a
					end
				}
				replaced_patt = Application.new(lhs_pattern.symbol,replaced_args)
				output += 'H(' + replaced_patt.show() + ') = '
				output += constructor.show()+"\n" 
			end
		end

		output += 'H(' + lhs_pattern.show() + ') = ' + 'H(' + self.show() +')'

		return output
	end
	
end


# implementation of the 'COMPILE' procedure for a definitional tree

class Branch < DefTreeNode

	#(1) to handle the case when the node is a Branch
	def compile
		output = ''
		self.children.each do |child|
			output += child.compile()
		end

		inductive_var = self.variable

		output += 'H(' + self.pattern.show() +') = '
		# replace RHS of the branch, replace the inductive_var by H(inductive_var)
		replaced_branch_patt = self.pattern.replace(inductive_var)
		output += 'H(' + replaced_branch_patt.show() +')'
		output += "\n"

		return output
	end

end

class Exempt < DefTreeNode

	#(3) to handle the case when the node is Exempt
	def compile
		output = 'H(' + self.pattern.show() +') = abort'
		output += "\n"

		return output
	end

end

class Leaf < DefTreeNode

	#(2) to handle the case when the node is a Leaf(Rule)
	def compile
		rule_rhs = self.expression
		output = ''
		output += rule_rhs.generate_H(self.pattern)
		output += "\n"
		return output

	end

end

