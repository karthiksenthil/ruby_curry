require_relative './definitional_tree.rb'
require_relative './replace.rb'

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
		# to handle the case when RHS of the rule is a pattern or symbol
		if rule_rhs.class == Application || rule_rhs.class == XSymbol
			# identify the leading symbol of RHS 
			leading_symbol = rule_rhs.class == Application ? rule_rhs.symbol : rule_rhs
			output += 'H(' + self.pattern.show() + ') = '
			if leading_symbol.kind == :oper  # case (2.1) i.e. operator-rooted
				output += 'H(' + rule_rhs.show() +')'
			elsif leading_symbol.kind == :ctor	# case (2.2) i.e. constructor-rooted
				output += rule_rhs.show()
			end

		elsif rule_rhs.class == Variable
			var_type = "list" # hard-coded for the case of append.rb, alt -> rule_rhs.type ?
			constructors = $constructors_hash[var_type]

			if !constructors.nil?
				# l_prime -> r_prime where r_prime is expr when r is replaced by a constructor
				constructors.each do |constructor|
					replaced_args = self.pattern.arguments.map{|a| 
						if a == rule_rhs
							constructor
						else
							a
						end
					}
					replaced_patt = Application.new(self.pattern.symbol,replaced_args)
					output += 'H(' + replaced_patt.show() + ') = '
					output += constructor.show()+"\n" 
				end
			end

			output += 'H(' + self.pattern.show() + ') = ' + 'H(' + rule_rhs.show() +')'
		end


		output += "\n"
		return output

	end

end

