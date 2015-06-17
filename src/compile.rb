require_relative './definitional_tree.rb'
require_relative './replace.rb'

# class to represent the set rules obtained as output of compile procedure
# lhs -> Expression
# rhs -> Expression
class Rule
	attr_accessor :lhs,:rhs

	def initialize(lhs,rhs)
		@lhs = lhs
		@rhs = rhs
	end

end

# extending the Application and Variable classes for compile procedure
# to handle the Leaf node case

class Application < Expression

	def generate_H(lhs_pattern)
		output_lhs = H.new(lhs_pattern)
		output_rhs = nil
		# identify the leading symbol of RHS 
		leading_symbol = self.symbol
		if leading_symbol.kind == :oper # case 2.1 i.e operator rooted
			output_rhs = H.new(self)
		elsif leading_symbol.kind == :ctor # case 2.2 i.e constructor rooted
			output_rhs = self
		end

		output = [Rule.new(output_lhs,output_rhs)]
		return output
	end

end

class Variable < Expression

	def generate_H(lhs_pattern)
		var_type = "list" # hard-coded for the case of append.rb, alt -> rule_rhs.type ?
		output = []
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
				output_lhs = H.new(replaced_patt)
				output_rhs = constructor
				output += [Rule.new(output_lhs,output_rhs)] 
			end
		end

		
		output += [Rule.new(H.new(lhs_pattern),H.new(self))]

		return output
	end

end


# implementation of the 'COMPILE' procedure for a definitional tree

class Branch < DefTreeNode

	#(1) to handle the case when the node is a Branch
	def compile
		output = []
		self.children.each do |child|
			output += child.compile()
		end

		inductive_var = self.variable

		# replace RHS of the branch, replace the inductive_var by H(inductive_var)
		replaced_branch_patt = self.pattern.replace(inductive_var)
		output += [Rule.new(H.new(self.pattern),H.new(replaced_branch_patt))]

		return output
	end

end

class Exempt < DefTreeNode

	#(3) to handle the case when the node is Exempt
	def compile
		output = [Rule.new(H.new(self.pattern),H.new(Variable.new("abort")))]
		return output
	end

end

class Leaf < DefTreeNode

	#(2) to handle the case when the node is a Leaf(Rule)
	def compile
		rule_rhs = self.expression
		output = []
		output += rule_rhs.generate_H(self.pattern)
		return output

	end

end

