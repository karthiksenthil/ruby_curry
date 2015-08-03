require_relative './expressions.rb'


class CurryType
	# type_name => Name of the curry data type
	# constructors => array of constructors for curry data type
	attr_accessor :type_name,:constructors

	def initialize(type_name,type_constructors)
		@type_name = type_name
		@constructors = type_constructors
	end

end


class CurryModule
	# operations => an array of the operation symbols in the curry module
	# curry_data_types => array of curry data type objects
	attr_accessor :operations, :curry_data_types

	def initialize(operations,curry_data_types)
		@operations = operations
		@curry_data_types = curry_data_types
	end

end

=begin
# Program 1 : List append Curry program
require_relative '../examples/append.rb'
prog1 = CurryModule.new($program_symbols,$append_tree)
# first generate the H function for this program's definitional tree
# currently it prints it to console, discuss with sir about how to store the output
Evaluate_tree.new(prog1.root_of_def_tree).print_in_ruby()
# posssible idea : print output to file, require the file here and then call H
# second find the main expression and store in main_expr
# call main_expr.H()
# Doubts : How to invoke N and A for this program ?

# another possible code
# Compiler.new(prog1,main_expr)
=end