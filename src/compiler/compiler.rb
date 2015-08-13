require_relative '../compiler/generate_h.rb'

# function to compile a curry module
# prog => a curry module object 
def compiler(prog)

	constructor_token = CONSTRUCTOR
	prog.curry_data_types.each do |dt|
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

	object_code_dir = "/home/karthik/Documents/GSoC2015/PSU_stuff/definitional_trees/code/DefinitionalTree/user"
	object_code_file = File.new(object_code_dir+"/"+prog.module_name+"_objectCode.rb","w")
	object_code_file.write(object_code)
	# puts object_code

end

def object_code_initialise(prog)
	output = "require_relative '../src/runtime/function_N.rb'\n"
	output += "require_relative '../src/runtime/function_A.rb'\n"
	output += "require_relative '../src/compiler/expressions.rb'\n"
	output += "require_relative '../src/compiler/symbols.rb'\n"
	output += "require_relative '../examples/"+prog.module_name+".rb'\n"
	
	output += "\n"
	# assigning token values in object code
	constructor_token = CONSTRUCTOR
	prog.curry_data_types.each do |dt|
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
	output += print_spaces(1) + "main_expr.N()\n"
	output += "end\n"
	return output
end

def main
  program_name = ARGV.first
  # Module.new.module_eval(File.read(program_name))
  require program_name
  compiler($currymodule)
end

main




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