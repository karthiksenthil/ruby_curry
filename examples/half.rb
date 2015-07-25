require_relative '../src/definitional_tree.rb'
require_relative '../src/generate_h.rb'


# Example to construct definitonal tree for the rules representing
# the integer division by 2 operation(half) on natural numbers

# Rules:
# General rule -> half(x1)
# 1. half(0) = 0
# 2. half(s(0)) = 0
# 3. half(s(s(x2))) = s(half(x2))

# Tokens for constructors in this example
ZERO = CONSTRUCTOR
SUCC = ZERO + 1

# expression constructors with Box wrapper
def make_zero
	return Box.new(Application.new($zero_symbol,[]))
end

def make_succ(x)
	return Box.new(Application.new($s_symbol,[x]))
end

def make_half(x)
	return Box.new(Application.new($half_symbol,[x]))
end

# symbols in the example
$half_symbol = XSymbol.new("half",1,OPERATION)
$zero_symbol = XSymbol.new("zero",0,ZERO)
$s_symbol = XSymbol.new("s",1,SUCC)

if $constructors_hash["integer"].nil?
	$constructors_hash["integer"] = [$zero_symbol,$s_symbol]	
else
	$constructors_hash["integer"] += [$zero_symbol,$s_symbol]
end

if $constructors_hash["peano"].nil?
	$constructors_hash["peano"] = [$s_symbol]	
else
	$constructors_hash["peano"] += [$s_symbol]
end

# Variables in the rules
x1 = make_variable("x1","integer")
x2 = make_variable("x2","integer")
x3 = make_variable("x3","integer")

# rule 1
lhs1 = make_half(make_zero)
rhs1 = make_zero
child1 = Leaf.new(lhs1,rhs1)

# rule 2
lhs2 = make_half(make_succ(make_zero))
rhs2 = make_zero
child3 = Leaf.new(lhs2,rhs2)

#rule 3
lhs3 = make_half(make_succ(make_succ(x3)))
rhs3 = make_succ(make_half(x3))
child4 = Leaf.new(lhs3,rhs3)

# in child2 branch node, x2 is the inductive variable
child2_patt = make_half(make_succ(x2))
child2 = Branch.new(child2_patt,x2,[child3,child4])


# definitonal tree for the above rules, in the root node x1 is the inductive variable
root_patt = make_half(x1)
root_node = Branch.new(root_patt,x1,[child1,child2])
root_node.pretty_print()
print "\n"

print "\nOutput of compile function on definitional tree\n"

# rules = root_node.compile()
# rules.each do |rule|
# 	print rule.show() + "\n"
# end

Evaluate_tree.new(root_node).print_in_ruby
