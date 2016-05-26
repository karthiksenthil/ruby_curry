require_relative '../src/compiler/definitional_tree.rb'
require_relative '../src/compiler/curry_module.rb'
require_relative '../src/runtime/lib/boolean.rb'
# require_relative '../flpcode/colors.rb'

# Example to construct definitonal tree for the rules representing
# the append operation(on lists or arrays)

# Rules:
# General rule -> append xs ys
# 1. append [] ys = ys
# 2. append (z:zs) ys = z:(append zs ys)
# 3. main = append [1,2] [3,4]


# Symbols in the rules
$append_symbol = Operation.new("append",2,nil)
XNIL = CONSTRUCTOR
CONS = XNIL + 1
$nil_list_symbol = Constructor.new("nil_list",0)
$cons_symbol = Constructor.new("cons",2)
$main_symbol = Operation.new("main",2,nil)

# expression constructors
def make_append(x,y)
	return Box.new(Application.new($append_symbol,[x,y]))
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

# Variables in the rules
$xs = make_variable("xs","list")
$ys = make_variable("ys","list")
$z = make_variable("z","list")
$zs = make_variable("zs","list")

# child1 i.e rule1 ; lhs = pattern and rhs = expression
lhs1 = make_append(make_nil,$ys)
rhs1 = $ys	
child1 = Leaf.new(lhs1,rhs1)

# child2 i.e rule2
# (z:zs) itself is another sub-pattern which is built using the : symbol
lhs2 = make_append(make_cons($z,$zs),$ys)
# similarly (append zs ys)
rhs2 = make_cons($z,make_append($zs,$ys))
child2 = Leaf.new(lhs2,rhs2)

# definitional tree for above rules

rootpatt = make_append($xs,$ys)
$append_tree = Branch.new(rootpatt,$xs,[child1,child2])
$append_symbol.def_tree = $append_tree


# definitional tree for main
main_tree_patt = make_main
main_tree_expr = make_append(make_cons(make_true,make_nil),make_cons(make_false,make_nil))
$main_tree = Leaf.new(main_tree_patt,main_tree_expr)
$main_symbol.def_tree = $main_tree


$program_operations = [$append_symbol,$main_symbol]
# curry data types
$list_type = CurryType.new("list",[$nil_list_symbol,$cons_symbol])
$boolean_type = CurryType.new("boolean",[$true_symbol,$false_symbol])
# $color_type = CurryType.new("color",[$red_symbol,$green_symbol,$blue_symbol])
$program_data_types = [$list_type,$boolean_type]

$currymodule = CurryModule.new($program_operations,$program_data_types,"append")


