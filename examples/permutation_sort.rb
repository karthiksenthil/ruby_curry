require_relative '../src/definitional_tree.rb'

# Example to construct definitional trees for permutation sort
# example in Curry
	
# Operation 1
# ndinsert : General rule -> ndinsert x ys
# ndinsert x ys = x : ys
# ndinsert x (y:ys) = y : ndinsert x ys

# constructor tokens
CONS = CONSTRUCTOR

# symbols in the rules
$ndinsert_symbol = XSymbol.new("ndinsert",2,OPERATION)
$cons_symbol = XSymbol.new("cons",2,CONSTRUCTOR)

if $constructors_hash["list"].nil?
	$constructors_hash["list"] = [$cons_symbol]
else
	$constructors_hash["list"] += [$cons_symbol]
end 

# expression constructors/helpers
def make_ndinsert(x,y)
	return Box.new(Application.new($ndinsert_symbol,[x,y]))
end

def make_cons(x,y)
	return Box.new(Application.new($cons_symbol,[x,y]))
end


# variables in the rules
x = make_variable("x","list")
ys = make_variable("ys","list")
y = make_variable("y","list")


ndinsert_leaf1_lhs = make_ndinsert(x,make_cons(y,ys))
ndinsert_leaf1_rhs = make_cons(y,make_ndinsert(x,ys))
ndinsert_leaf1 = Leaf.new(ndinsert_leaf1_lhs,ndinsert_leaf1_rhs)

ndinsert_rootpatt = make_ndinsert(x,ys)
ndinsert_rootbranch = Branch.new(ndinsert_rootpatt,ys,[ndinsert_leaf1])


ndinsert_rootbranch.pretty_print()
print "\n"


