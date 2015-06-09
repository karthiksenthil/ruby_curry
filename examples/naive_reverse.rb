require_relative '../src/definitional_tree.rb'
require_relative '../src/compile.rb'

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
reverse_symbol = XSymbol.new("rev",1,:oper)

# Variable
x = Variable.new("x")

# rule 1
lhs1 = Application.new(reverse_symbol,[@nil_list_symbol])
rhs1 = @nil_list_symbol
child1 = Leaf.new(lhs1,rhs1)

# rule 2
lhs2 = Application.new(reverse_symbol,[Application.new(@cons_symbol,[x,@xs])])
rhs2 = Application.new(@append_symbol,[Application.new(reverse_symbol,[@xs]),Application.new(@cons_symbol,[x,@nil_list_symbol])])
child2 = Leaf.new(lhs2,rhs2)


rev_tree_rootpatt = Application.new(reverse_symbol,[@xs])
rev_tree_rootnode = Branch.new(rev_tree_rootpatt,@xs,[child1,child2])
rev_tree_rootnode.pretty_print()
print "\n"

print "\nOutput of compile function on definitional tree\n"
compile(rev_tree_rootnode)
