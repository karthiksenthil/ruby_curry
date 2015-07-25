require_relative '../src/definitional_tree.rb'
require_relative '../src/generate_h.rb'

# Example to construct definitonal trees for a curry program
# to reverse a list
# Program link : http://www-ps.informatik.uni-kiel.de/smap/smap.cgi?browser/1

# 2 operations : append & rev

# Rules for append -
# General rule -> append xs ys
# 1. append [] ys = ys
# 2. append (z:zs) ys = z:(append zs ys)

# Rules for rev -
# General rule -> rev xs
# 1. rev [] = []
# 2. rev (x:xs) = append (rev xs) [x]

# import the append operation's definitional tree from append.rb
require_relative 'append.rb'

# Symbol for reverse operation
$reverse_symbol = XSymbol.new("reverse",1,OPERATION)

# expression constructors
def make_reverse(x)
	return Box.new(Application.new($reverse_symbol,[x]))
end

# Variable
# "*" denotes that x can be a Variable of any type 
x = make_variable("x","*")

# rule 1
lhs1 = make_reverse(make_nil)
rhs1 = make_nil
child1 = Leaf.new(lhs1,rhs1)

# rule 2
lhs2 = make_reverse(make_cons(x,$xs))
# rhs2 = Application.new(@append_symbol,[Application.new(reverse_symbol,[@xs]),Application.new(@cons_symbol,[x,Application.new(@nil_list_symbol,[])])])
rhs2 = make_append(make_reverse($xs),make_cons(x,make_nil))
child2 = Leaf.new(lhs2,rhs2)


rev_tree_rootpatt = make_reverse($xs)
rev_tree_rootnode = Branch.new(rev_tree_rootpatt,$xs,[child1,child2])

# execute compile on def tree only if file is executed directly
if __FILE__ == $0
	rev_tree_rootnode.pretty_print()
	print "\n"

	print "\nOutput of compile function on definitional tree\n"

	# rules = rev_tree_rootnode.compile()
	# rules.each do |rule|
	# 	print rule.show() + "\n"
	# end

	main(rev_tree_rootnode)
end

# DISCUSS : How to include the H function of the other defintional tree i.e append.
# Question : If a definitional tree has 2 or more operations, how to include the
# H function of each operation


