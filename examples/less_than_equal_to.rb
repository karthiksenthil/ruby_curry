require_relative '../src/definitional_tree.rb'

# Example to construct definitonal tree for the rules representing
# the less than equal to operation(<=) on natural numbers

# Rules:
# General rule -> x1 <= x2
# 1. 0 <= x2 = true
# 2. s(x3) <= 0 = false
# 3. s(x3) <= s(x2) = x3<= x2

# Symbols in the rules
less_than_equal_symbol = XSymbol.new("<=",2,:oper)
zero_symbol = XSymbol.new("0",0,:ctor)
s_symbol = XSymbol.new("s",1,:oper)
true_symbol = XSymbol.new("true",0,:ctor)
false_symbol = XSymbol.new("false",0,:ctor)


# Variables in the rules
x1 = Variable.new("x1")
x2 = Variable.new("x2")
x3 = Variable.new("x3")

# rule 1
lhs1 = Application.new(less_than_equal_symbol,[zero_symbol,x2])
rhs1 = true_symbol
child1 = Leaf.new(lhs1,rhs1)

# rule 2
lhs2 = Application.new(less_than_equal_symbol,[Application.new(s_symbol,[x3]),zero_symbol])
rhs2 = false_symbol
child3 = Leaf.new(lhs2,rhs2)

#rule 3
lhs3 = Application.new(less_than_equal_symbol,[Application.new(s_symbol,[x3]),Application.new(s_symbol,[x2])])
rhs3 = Application.new(less_than_equal_symbol,[x3,x2])
child4 = Leaf.new(lhs3,rhs3)


# in child2 branch node, x2 is the inductive variable
child2_patt = Application.new(less_than_equal_symbol,[Application.new(s_symbol,[x3]),x2])
child2 = Branch.new(child2_patt,x2,[child3,child4])


# definitonal tree for the above rules, in the root node x1 is the inductive variable
root_patt = Application.new(less_than_equal_symbol,[x1,x2])
root_node = Branch.new(root_patt,x1,[child1,child2])