require_relative '../compiler/generate_h.rb'
require_relative '../frontend/def_tree_construct.rb'

# function to compile a curry module
# prog => a curry module object 
def compiler(program_name)

	JSONParser.loadJSON(program_name+".json")
	
	#key : data type
	#value : array of constructors
	program_constructors = {}
	program_operations = []
	# define the symbols in the program
	$symbol_table.each do |key,val|
		sym_name = key
		sym_attributes = val

		case sym_attributes[:sym_type]
		when "Constructor"
			c = Constructor.new(sym_name,sym_attributes[:arity])
			c.token_value = sym_attributes[:token]
			cons_dtype = sym_attributes[:data_type]
			if program_constructors[cons_dtype].nil?
				program_constructors[cons_dtype] = [c]
			else
				program_constructors[cons_dtype] << c
			end
		when "Operation"
			o = Operation.new(sym_name,sym_attributes[:arity],nil)
			program_operations << o
		end

	end

	# copy program constructors to global constructors_hash
	$constructors_hash = program_constructors

	# define CurryTypes
	program_data_types = []
	program_constructors.each do |type,cons|
		program_data_types << CurryType.new(type,cons)
	end

	# build definitional trees for operations
	build_definitional_trees($operation_rules,program_operations)

	curry_module = CurryModule.new(program_operations,program_data_types,program_name)
	prog = curry_module

	# prog.operations.each do |oper|
	# 	oper.def_tree.pretty_print()
	# end
	
	object_code = object_code_initialise(prog) 

	prog.operations.each do |oper|
		object_code += "\n\n" + Generate_H.new(oper.def_tree).print_in_ruby() + "\n\n"
	end

	object_code += object_code_main()

	object_code_dir = `pwd`.strip
	object_code_file = File.new(program_name+"_objectCode.rb","w")
	object_code_file.write(object_code)
	# puts object_code

end

def build_definitional_trees(rules,prog_ops)
	rules.each do |op_name,op_rules|
		prog_ops.each do |op|
			if op.name == op_name
				op.def_tree = DefTreeBuilder.build_tree(op_rules)
			end
		end
	end
end


def object_code_initialise(prog)
	output = "require_relative '../src/runtime/function_N.rb'\n"
	output += "require_relative '../src/runtime/function_A.rb'\n"
	output += "require_relative '../src/compiler/expressions.rb'\n"
	output += "require_relative '../src/compiler/symbols.rb'\n"
	output += "require_relative '../src/compiler/utilities.rb'\n"
	output += "require_relative '../src/compiler/repl.rb'\n"
	# output += "require_relative './"+prog.module_name+".rb'\n"
	
	output += "\n"
	# define choice symbol in object code
	output += "#Choice symbol and H function defined are globally defined in symbols.rb\n"
	# define constructor symbols in object code
	prog.curry_data_types.each do |dt|
		dt.constructors.each do |constructor|
			output += "$"+constructor.show()+"_symbol = Constructor.new('#{constructor.show}',#{constructor.arity})\n"
			output += "$"+constructor.show()+"_symbol.token_value = "+constructor.token.to_s+"\n"
		end
	end

	# define operation symbols in object code
	# Important : Definitional tree need not be defined in object code ?
	# It is used only to construct the H function, not used during object code execution
	prog.operations.each do |o|
		output += "$"+o.show()+"_symbol = Operation.new('#{o.show()}',#{o.arity},nil)\n"
	end

	output += "\n"

	return output
end

def object_code_main
	output = "def main\n"
	output += print_spaces(1) + "main_expr = Box.new(Application.new($main_symbol,[]))\n"
	output += print_spaces(1) + "repl(main_expr)\n"
	output += "end\n"
	output += "\nmain\n"
	return output
end

compiler(ARGV.first)




=begin
####### EXAMPLE : list append #######
require_relative '../usr/append.rb'
prog1 = CurryModule.new($program_operations,$program_data_types,"append")
compiler(prog1)
=end

=begin
####### EXAMPLE : reverse #######
require_relative '../usr/reverse.rb'
prog2 = CurryModule.new($program_operations,$program_data_types,"reverse")
compiler(prog2)
=end