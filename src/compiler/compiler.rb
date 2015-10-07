require_relative '../compiler/generate_h.rb'

# function to compile a curry module
# prog => a curry module object 
def compiler(program_name)

	require program_name+".rb"
	prog = $currymodule

	prog.curry_data_types.each do |dt|
		constructor_token = CONSTRUCTOR
		dt.constructors.each do |constructor|
			constructor.token_value = constructor_token
			constructor_token += 1
		end
	end
	
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

def object_code_initialise(prog)
	output = "require_relative '../src/runtime/function_N.rb'\n"
	output += "require_relative '../src/runtime/function_A.rb'\n"
	output += "require_relative '../src/compiler/expressions.rb'\n"
	output += "require_relative '../src/compiler/symbols.rb'\n"
	output += "require_relative '../src/compiler/utilities.rb'\n"
	output += "require_relative '../src/compiler/repl.rb'\n"
	output += "require_relative './"+prog.module_name+".rb'\n"
	
	output += "\n"
	# assigning token values in object code
	prog.curry_data_types.each do |dt|
		constructor_token = CONSTRUCTOR
		dt.constructors.each do |constructor|
			output += "$"+constructor.show()+"_symbol.token_value = "+constructor_token.to_s+"\n"
			constructor_token += 1
		end
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