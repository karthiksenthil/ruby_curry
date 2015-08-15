require_relative '../src/compiler/definitional_tree.rb'
require_relative '../src/compiler/curry_module.rb'
require_relative '../src/runtime/lib/boolean.rb'

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
$reverse_symbol = Operation.new("reverse",1,nil)

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
$reverse_symbol.def_tree = rev_tree_rootnode

# definitional tree for main
main_tree_patt = make_main
main_tree_expr = make_reverse(make_append(make_cons(make_true,make_nil),make_cons(make_false,make_nil)))
# test : make_reverse(make_append(make_append(make_cons(make_true,make_nil),make_cons(make_false,make_nil)),make_cons(make_false,make_nil)))
$main_tree = Leaf.new(main_tree_patt,main_tree_expr)
$main_symbol.def_tree = $main_tree

$program_operations = [$append_symbol,$reverse_symbol,$main_symbol]
# curry data types
$list_type = CurryType.new("list",[$nil_list_symbol,$cons_symbol])
$boolean_type = CurryType.new("boolean",[$true_symbol,$false_symbol])
$program_data_types = [$list_type,$boolean_type]

$currymodule = CurryModule.new($program_operations,$program_data_types,"reverse")
