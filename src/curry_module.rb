require_relative './expressions.rb'
require_relative './generate_h.rb'
require_relative './function_A.rb'
require_relative './function_N.rb'

class CurryModule
	# symbols => an array of the constructor/operation symbols in the Curry program
	# root_of_def_tree => the root node of the program's definitional tree
	attr_accessor :symbols, :root_of_def_tree

	def initialize(symbols,root)
		@symbols = symbols
		@root_of_def_tree = root
	end

end


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
