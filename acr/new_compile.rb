require_relative '../src/definitional_tree.rb'
require_relative '../src/utilities.rb'
require_relative 'abstraction.rb'
require_relative 'entries.rb'


class Branch < DefTreeNode

	def compile
		inductive_var_path = self.pattern.content.find_path(self.variable.content)
		case_entries = [Variable_entry.new,Choice_entry.new,Fail_entry.new,Operation_entry.new]

		var_type = self.variable.content.type
		if var_type=="*" # include all the constructors for a Variable of any type
			constructors = $constructors_hash.values.flatten
		else
			constructors = $constructors_hash[var_type]
		end

		(0..constructors.length-1).each do |i|
			constructor_token = constructors[i].token
			constructor_abstract_h = self.children[i].compile()
			constructor_entry = Constructor_entry.new(constructor_token,constructor_abstract_h)
			case_entries << constructor_entry
		end

		branch_case = Case_H.new(inductive_var_path,case_entries)
		# puts branch_case.inspect

		return branch_case
		
	end

end

class Leaf < DefTreeNode

	def compile
			
		case self.expression.content.symbol.token
		when VARIABLE
			return "Leaf variable-on-RHS case not implemented yet"
		when OPERATION
			return RHS_Replace_H.new(self.expression.content.meta_expr_format(self.pattern.content),"operation")
		else
			return RHS_Replace_H.new(self.expression.content.meta_expr_format(self.pattern.content),"constructor")
		end

	end

end


class Evaluate_tree
	attr_accessor :def_tree

	def initialize(def_tree)
		@def_tree = def_tree
	end

	def print_in_ruby(indent=0)
		output = "def H(expr)\n"
		output += def_tree.compile.print_in_ruby(indent+1)
		output += "end\n"
		puts output
	end

end
