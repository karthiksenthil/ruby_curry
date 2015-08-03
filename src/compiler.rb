require_relative './generate_h.rb'
require_relative '../run_time/function_N.rb'
require_relative '../run_time/function_A.rb'


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

	prog.operations.each do |oper|
		Generate_H.new(oper.def_tree).print_in_ruby()
	end

end



####### EXAMPLE : list append #######
require_relative '../examples/append.rb'
prog1 = CurryModule.new($program_operations,$program_data_types)
compiler(prog1)