require_relative '../src/definitional_tree.rb'

# Example to construct definitonal tree for the rules representing
# the integer division by 2 operation(half) on natural numbers

# Rules:
# General rule -> half(x1)
# 1. half(0) = 0
# 2. half(s(0)) = 0
# 3. half(s(s(x2))) = s(half(x2))

# Symbols in the rules
half_symbol = XSymbol.new("half",1,:oper)
zero_symbol = XSymbol.new("0",1,:ctor)
s_symbol = XSymbol.new("s",1,:ctor)

# Variables in the rules
x1 = Variable.new("x1")
x2 = Variable.new("x2")
x3 = Variable.new("x3")

# rule 1
lhs1 = Application.new(half_symbol,[zero_symbol])
rhs1 = zero_symbol
child1 = Leaf.new(lhs1,rhs1)

# rule 2
lhs2 = Application.new(half_symbol,[Application.new(s_symbol,[zero_symbol])])
rhs2 = zero_symbol
child3 = Leaf.new(lhs2,rhs2)

#rule 3
lhs3 = Application.new(half_symbol,[Application.new(s_symbol,[Application.new(s_symbol,[x3])])])
rhs3 = Application.new(s_symbol,[Application.new(half_symbol,[x3])])
child4 = Leaf.new(lhs3,rhs3)

# in child2 branch node, x2 is the inductive variable
child2_patt = Application.new(half_symbol,[Application.new(s_symbol,[x2])])
child2 = Branch.new(child2_patt,x2,[child3,child4])


# definitonal tree for the above rules, in the root node x1 is the inductive variable
root_patt = Application.new(half_symbol,[x1])
root_node = Branch.new(root_patt,x1,[child1,child2])
