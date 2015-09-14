# classes to define entries of the case statement in H function

class Entry
end

class Variable_entry < Entry

	def print_in_ruby(indent=0)
		output = print_spaces(indent)+"when VARIABLE"+"\n"
		output += print_spaces(indent+1)+"raise 'Handling Variables not implemented yet'"+"\n"
		return output
	end

end

class Operation_entry < Entry

	def print_in_ruby(indent=0)
		output = print_spaces(indent)+"when OPERATION"+"\n"
		output += print_spaces(indent+1)+"inductive_arg"+$inductive_arg_counter.to_s+".H()"+"\n"
		output += print_spaces(indent+1)+"expr.H()"+"\n"
		return output
	end

end

class Fail_entry < Entry

	def print_in_ruby(indent=0)
		output = print_spaces(indent)+"when FAIL"+"\n"
		output += print_spaces(indent+1)+"expr.replace($fail_expression.content)"+"\n"
		return output
	end

end

class Choice_entry < Entry

	def print_in_ruby(indent=0)
		output = print_spaces(indent)+"when CHOICE"+"\n"
		output += print_spaces(indent+1)+"inductive_arg"+$inductive_arg_counter.to_s+".H()"+"\n"
		output += print_spaces(indent+1)+"expr.H()"+"\n"
		return output
	end

end

class Constructor_entry < Entry
	attr_accessor :token_of_constructor, :abstract_h, :constructor_name

	def initialize(token,abstract_h,name)
		@token_of_constructor = token
		@abstract_h = abstract_h
		@constructor_name = name
	end

	def print_in_ruby(indent=0)
		output = print_spaces(indent)+"when "+@token_of_constructor.to_s+"  #"+constructor_name+"\n"
		if @abstract_h.class == String
			output += @abstract_h
		else
			output += @abstract_h.print_in_ruby(indent+1)
		end
		return output
	end

end