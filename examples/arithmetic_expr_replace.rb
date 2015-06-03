require_relative '../src/definitional_tree.rb'

# Example to construct definitonal tree for the rules representing
# the replace function on arithmetic expressions
# link http://www-ps.informatik.uni-kiel.de/smap/smap.cgi?browser/21

# General rule : replace e1 p e2
# 1. replace _ [] x = x
# 2. replace (Add l r) (1:p) x = Add (replace l p x) r
# 3. replace (Add l r) (2:p) x = Add l (replace r p x)
# 4. replace (Mul l r) (1:p) x = Mul (replace l p x) r
# 5. replace (Mul l r) (2:p) x = Mul l (replace r p x)

# Symbols in the rules
replace_symbol = XSymbol.new("replace",3,:oper)
add_symbol = XSymbol.new("Add",2,:oper)
mul_symbol = XSymbol.new("Mul",2,:oper)
nil_lis_symbol = XSymbol.new("[]",0,:ctor)
cons_symbol = XSymbol.new(":",2,:ctor)
integer_one = XSymbol.new("1",0,:ctor)
integer_two = XSymbol.new("2",0,:ctor)
blank_exp = XSymbol.new("_",0,:ctor)

# Variables in the rules
e1 = Variable.new("e1")
p = Variable.new("p")
e2 = Variable.new("e2")
l = Variable.new("l")
r = Variable.new("r")

# leaf 1 i.e rule 1
lhs1 = Application.new(replace_symbol,[blank_exp,nil_lis_symbol,e2])
rhs1 = e2
leaf1 = Leaf.new(lhs1,rhs1)

# leaf 2 i.e rule 2
lhs2 = Application.new(replace_symbol,[Application.new(add_symbol,[l,r]),
														Application.new(cons_symbol,[integer_one,p]),e2])
rhs2 = Application.new(add_symbol,[Application.new(replace_symbol,[l,p,e2]),r])
leaf2 = Leaf.new(lhs2,rhs2)

# leaf 3 i.e rule 3
lhs3 = Application.new(replace_symbol,[Application.new(add_symbol,[l,r]),
														Application.new(cons_symbol,[integer_two,p]),e2])
rhs3 = Application.new(add_symbol,[l,Application.new(replace_symbol,[r,p,e2])])
leaf3 = Leaf.new(lhs3,rhs3)

# leaf 4 i.e rule 4
lhs4 = Application.new(replace_symbol,[Application.new(mul_symbol,[l,r]),
														Application.new(cons_symbol,[integer_one,p]),e2])
rhs4 = Application.new(mul_symbol,[Application.new(replace_symbol,[l,p,e2]),r])
leaf4 = Leaf.new(lhs4,rhs4)

# leaf 5 i.e rule 5
lhs5 = Application.new(replace_symbol,[Application.new(mul_symbol,[l,r]),
														Application.new(cons_symbol,[integer_two,p]),e2])
rhs5 = Application.new(mul_symbol,[l,Application.new(replace_symbol,[r,p,e2])])
leaf5 = Leaf.new(lhs5,rhs5)


# branch 1
branch1_patt = Application.new(replace_symbol,[blank_exp,p,e2])
branch1 = Branch.new(branch1_patt,p,[leaf1])

# branch 2
branch2_patt = Application.new(replace_symbol,[Application.new(add_symbol,[l,r]),p,e2])
branch2 = Branch.new(branch2_patt,p,[leaf2,leaf3])

# branch 3
branch3_patt = Application.new(replace_symbol,[Application.new(mul_symbol,[l,r]),p,e2])
branch3 = Branch.new(branch3_patt,p,[leaf4,leaf5])

# root node for replace
replace_rootpatt = Application.new(replace_symbol,[e1,p,e2])
replace_rootnode = Branch.new(replace_rootpatt,e1,[branch1,branch2,branch3])

replace_rootnode.pretty_print()
print "\n"
