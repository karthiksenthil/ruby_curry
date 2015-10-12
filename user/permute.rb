require_relative '../src/compiler/definitional_tree.rb'
require_relative '../src/compiler/curry_module.rb'
require_relative '../src/runtime/lib/boolean.rb'

# Example to construct definitonal trees for a curry program
# to permute a list

# Rules for ndinsert -
# General rule -> ndinsert x y
# 1. ndinsert x [] = [x]
# 2. ndinsert x (y:ys) = choice(x:y:ys, y:ndinsert x ys)

# Rules for permute -
# General rule -> permute x
# 1. permute [] = []
# 2. permute (x:xs) = ndinsert x (permute xs)

# symbols in the rules 
$permute_symbol = Operation.new("permute",1,nil)
$ndinsert_symbol = Operation.new("ndinsert",2,nil)
$nil_list_symbol = Constructor.new("nil_list",0)
$cons_symbol = Constructor.new("cons",2)
$main_symbol = Operation.new("main",2,nil)

# expression constructors
def make_permute(x)
	return Box.new(Application.new($permute_symbol,[x]))
end

def make_ndinsert(x,y)
	return Box.new(Application.new($ndinsert_symbol,[x,y]))
end

def make_nil
	return Box.new(Application.new($nil_list_symbol,[]))
end

def make_cons(x,y)
	return Box.new(Application.new($cons_symbol,[x,y]))
end

def make_main
	return Box.new(Application.new($main_symbol,[]))
end

if $constructors_hash["list"].nil?
	$constructors_hash["list"] = [$nil_list_symbol,$cons_symbol]
else
	$constructors_hash["list"] += [$nil_list_symbol,$cons_symbol]
end


# variables
$x = make_variable("x","list")
$y = make_variable("y","list")
$xs = make_variable("xs","list")
$ys = make_variable("ys","list")

# definitional tree for ndinsert
ndinsert_child1_lhs = make_ndinsert($x,make_nil)
ndinsert_child1_rhs = make_cons($x,make_nil)
ndinsert_child1 = Leaf.new(ndinsert_child1_lhs,ndinsert_child1_rhs)

ndinsert_child2_lhs = make_ndinsert($x,make_cons($y,$ys))
# choice :
# 1. x:y:ys
# 2. y:ndinsert(x,ys)
ndinsert_child2_rhs = make_choice(make_cons($x,make_cons($y,$ys)),make_cons($y,make_ndinsert($x,$ys)))
ndinsert_child2 = Leaf.new(ndinsert_child2_lhs,ndinsert_child2_rhs)

ndinsert_rootpatt = make_ndinsert($x,$y)
ndinsert_tree = Branch.new(ndinsert_rootpatt,$y,[ndinsert_child1,ndinsert_child2])
$ndinsert_symbol.def_tree = ndinsert_tree

# definitional tree for permute
permute_child1_lhs = make_permute(make_nil)
permute_child1_rhs = make_nil
permute_child1 = Leaf.new(permute_child1_lhs,permute_child1_rhs)

permute_child2_lhs = make_permute(make_cons($x,$xs))
permute_child2_rhs = make_ndinsert($x,make_permute($xs))
permute_child2 = Leaf.new(permute_child2_lhs,permute_child2_rhs)

permute_rootpatt = make_permute($x)
permute_tree = Branch.new(permute_rootpatt,$x,[permute_child1,permute_child2])
$permute_symbol.def_tree = permute_tree

# definitional tree for main
main_tree_patt = make_main
# permute(cons(false,cons(true,nil_list)))
main_tree_expr = make_permute(make_cons(make_false,make_cons(make_true,make_nil)))
$main_tree = Leaf.new(main_tree_patt,main_tree_expr)
$main_symbol.def_tree = $main_tree


$program_operations = [$ndinsert_symbol,$permute_symbol,$main_symbol]
# curry data types
$list_type = CurryType.new("list",[$nil_list_symbol,$cons_symbol])
$boolean_type = CurryType.new("boolean",[$true_symbol,$false_symbol])
# $color_type = CurryType.new("color",[$red_symbol,$green_symbol,$blue_symbol])
$program_data_types = [$list_type,$boolean_type]

$currymodule = CurryModule.new($program_operations,$program_data_types,"permute")

