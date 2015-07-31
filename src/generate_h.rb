require_relative '../src/definitional_tree.rb'
require_relative '../src/utilities.rb'
require_relative '../acr/abstraction.rb'
require_relative '../acr/entries.rb'

class Box

	def H
		if self.content.symbol.token != OPERATION
			raise "H is not defined on a non-operation rooted expression"
		else
			self.content.symbol(self)
		end
	end

end


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
			# in this case, we build a sub-branch with following :
			# 1. pattern = pattern of leaf
			# 2. inductive variable = variable on RHS of leaf
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

			pseudo_branch.compile


		when OPERATION
			return RHS_Replace_H.new(self.expression.content,self.pattern.content,"operation")
		else
			return RHS_Replace_H.new(self.expression.content,self.pattern.content,"constructor")
		end

	end

end

class Exempt < DefTreeNode

	def compile		
		return RHS_Replace_H.new($fail_expression.content,self.pattern.content,"constructor")
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
		# code to return back replaced expr after outer most case
		output += print_spaces(indent+1)+"expr"+"\n"
		output += "end\n"
		puts output
	end

end
