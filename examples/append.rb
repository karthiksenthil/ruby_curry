require_relative '../src/definitional_tree.rb'
require_relative '../tmp/new_compile.rb'

# Example to construct definitonal tree for the rules representing
# the append operation(on lists or arrays)

# Rules:
# General rule -> append xs ys
# 1. append [] ys = ys
# 2. append (z:zs) ys = z:(append zs ys)


# Symbols in the rules
$append_symbol = XSymbol.new("append",2,OPERATION)
XNIL = CONSTRUCTOR
CONS = XNIL + 1
$nil_list_symbol = XSymbol.new("nil_list",0,XNIL)
$cons_symbol = XSymbol.new("cons",2,CONS)

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
append_tree = Branch.new(rootpatt,$xs,[child1,child2])
append_tree.pretty_print()
print "\n"


# rules produced on running compile on append operation's definitional tree
puts "\nOutput of new compile function on the definitional tree\n"
main(append_tree)