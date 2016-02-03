require_relative '../src/compiler/definitional_tree.rb'
require_relative '../src/compiler/curry_module.rb'
require_relative '../src/runtime/lib/boolean.rb'

# Example to construct definitonal tree for the rules representing
# the or operation(on booleans)

# Rules:
# General rule -> or x y
# 1. or false y = y
# 2. or true y = true
# 3. main = or false true


# Symbols in the rules
$or_symbol = Operation.new("or",2,nil)
$main_symbol = Operation.new("main",2,nil)

# expression constructors
def make_or(x,y)
	return Box.new(Application.new($or_symbol,[x,y]))
end

def make_main
	return Box.new(Application.new($main_symbol,[]))
end

# Variables in the rules
$x = make_variable("x","boolean")
$y = make_variable("y","boolean")

# child1 i.e rule1 ; lhs = pattern and rhs = expression
lhs1 = make_or(make_true,$y)
rhs1 = make_true
child1 = Leaf.new(lhs1,rhs1)

# child2 i.e rule2
lhs2 = make_or(make_false,$y)
rhs2 = $y	
child2 = Leaf.new(lhs2,rhs2)

# definitional tree for above rules

rootpatt = make_or($x,$y)
$or_tree = Branch.new(rootpatt,$x,[child1,child2])
$or_symbol.def_tree = $or_tree


# definitional tree for main
main_tree_patt = make_main
main_tree_expr = make_or(make_false,make_choice(make_true,make_false))
$main_tree = Leaf.new(main_tree_patt,main_tree_expr)
$main_symbol.def_tree = $main_tree


$program_operations = [$or_symbol,$main_symbol]
# curry data types
$boolean_type = CurryType.new("boolean",[$true_symbol,$false_symbol])
$program_data_types = [$boolean_type]

$currymodule = CurryModule.new($program_operations,$program_data_types,"or")


