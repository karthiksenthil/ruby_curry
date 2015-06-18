require_relative '../src/definitional_tree.rb'
require_relative '../src/compile.rb'

# Example to construct definitonal tree for the rules representing
# the replace function on arithmetic expressions
# link http://www-ps.informatik.uni-kiel.de/smap/smap.cgi?browser/21

# General rule : replace e1 p e2
# 1. replace e1 [] e2 = e2
# 2. replace (Add l r) (1:v) x = Add (replace l v x) r
# 3. replace (Add l r) (2:v) x = Add l (replace r v x)
# 4. replace (Mul l r) (1:v) x = Mul (replace l v x) r
# 5. replace (Mul l r) (2:v) x = Mul l (replace r v x)

# Symbols in the rules
replace_symbol = XSymbol.new("replace",3,:oper)
add_symbol = XSymbol.new("Add",2,:ctor)
mul_symbol = XSymbol.new("Mul",2,:ctor)
nil_list_symbol = XSymbol.new("[]",0,:ctor)
cons_symbol = XSymbol.new(":",2,:ctor)
integer_one = XSymbol.new("1",0,:ctor)
integer_two = XSymbol.new("2",0,:ctor)
blank_exp = XSymbol.new("_",0,:ctor)
lit_symbol = XSymbol.new("Lit",1,:ctor)
var_symbol = XSymbol.new("Var",1,:ctor)
other_int_symbol = XSymbol.new("Other integers",0,:ctor)

if $constructors_hash["integer"].nil?
	$constructors_hash["integer"] = [integer_one,integer_two]
else
	$constructors_hash["integer"] += [integer_one,integer_two]
end

if $constructors_hash["unknown"].nil?
	$constructors_hash["unknown"] = [blank_exp,other_int_symbol]
else
	$constructors_hash["unknown"] += [blank_exp,other_int_symbol]
end

if $constructors_hash["arithmetic expressions"].nil?
	$constructors_hash["arithmetic expressions"] = [add_symbol,mul_symbol,lit_symbol,var_symbol]
else
	$constructors_hash["arithmetic expressions"] += [add_symbol,mul_symbol,lit_symbol,var_symbol]
end

# Variables in the rules
e1 = Variable.new("e1","arithmetic expressions")
p = Variable.new("p","list")
e2 = Variable.new("e2","arithmetic expressions")
u = Variable.new("u","element")
v = Variable.new("v","list")
l = Variable.new("l","arithmetic expressions")
r = Variable.new("r","arithmetic expressions")

# Lit type - exempt node
lit_exempt_patt = Application.new(replace_symbol,[Application.new(lit_symbol,[Application.new(blank_exp,[])]),Application.new(cons_symbol,[u,v]),e2])
lit_exempt = Exempt.new(lit_exempt_patt)

# Var type - exempt node
var_exempt_patt = Application.new(replace_symbol,[Application.new(var_symbol,[Application.new(blank_exp,[])]),Application.new(cons_symbol,[u,v]),e2])
var_exempt = Exempt.new(var_exempt_patt)

# Add leaf1 - rule 2
add_leaf1_lhs = Application.new(replace_symbol,[Application.new(add_symbol,[l,r]),Application.new(cons_symbol,[Application.new(integer_one,[]),v]),e2])
add_leaf1_rhs = Application.new(add_symbol,[Application.new(replace_symbol,[l,v,e2]),r])
add_leaf1 = Leaf.new(add_leaf1_lhs,add_leaf1_rhs)

# Add leaf2 - rule 3
add_leaf2_lhs = Application.new(replace_symbol,[Application.new(add_symbol,[l,r]),Application.new(cons_symbol,[Application.new(integer_two,[]),v]),e2])
add_leaf2_rhs = Application.new(add_symbol,[l,Application.new(replace_symbol,[r,v,e2])])
add_leaf2 = Leaf.new(add_leaf2_lhs,add_leaf2_rhs)

# Add exempt
add_exempt_patt = Application.new(replace_symbol,[Application.new(add_symbol,[l,r]),Application.new(cons_symbol,[Application.new(other_int_symbol,[]),v]),e2])
add_exempt = Exempt.new(add_exempt_patt)

# Add type - branch node
add_branch_patt = Application.new(replace_symbol,[Application.new(add_symbol,[l,r]),Application.new(cons_symbol,[u,v]),e2])
add_branch = Branch.new(add_branch_patt,u,[add_leaf1,add_leaf2,add_exempt])

# Mul leaf1 - rule 4
mul_leaf1_lhs = Application.new(replace_symbol,[Application.new(mul_symbol,[l,r]),Application.new(cons_symbol,[Application.new(integer_one,[]),v]),e2])
mul_leaf1_rhs = Application.new(mul_symbol,[Application.new(replace_symbol,[l,v,e2]),r])
mul_leaf1 = Leaf.new(mul_leaf1_lhs,mul_leaf1_rhs)

# Mul leaf2 - rule 5
mul_leaf2_lhs = Application.new(replace_symbol,[Application.new(mul_symbol,[l,r]),Application.new(cons_symbol,[Application.new(integer_two,[]),v]),e2])
mul_leaf2_rhs = Application.new(mul_symbol,[l,Application.new(replace_symbol,[r,v,e2])])
mul_leaf2 = Leaf.new(mul_leaf2_lhs,mul_leaf2_rhs)

# Mul exempt
mul_exempt_patt = Application.new(replace_symbol,[Application.new(mul_symbol,[l,r]),Application.new(cons_symbol,[Application.new(other_int_symbol,[]),v]),e2])
mul_exempt = Exempt.new(mul_exempt_patt)

# Mul(tiply) type - branch node
mul_branch_patt = Application.new(replace_symbol,[Application.new(mul_symbol,[l,r]),Application.new(cons_symbol,[u,v]),e2])
mul_branch = Branch.new(mul_branch_patt,u,[mul_leaf1,mul_leaf2,mul_exempt])

# branch 1
branch1_patt = Application.new(replace_symbol,[e1,Application.new(cons_symbol,[u,v]),e2])
branch1 = Branch.new(branch1_patt,e1,[lit_exempt,var_exempt,add_branch,mul_branch])

# leaf 1 i.e rule 1
leaf1_lhs = Application.new(replace_symbol,[e1,Application.new(nil_list_symbol,[]),e2])
leaf1_rhs = e2
leaf1 = Leaf.new(leaf1_lhs,leaf1_rhs)

# root node for replace
replace_rootpatt = Application.new(replace_symbol,[e1,p,e2])
replace_rootnode = Branch.new(replace_rootpatt,p,[leaf1,branch1])

replace_rootnode.pretty_print()
print "\n"

print "\nOutput of compile function on definitional tree\n"

rules = replace_rootnode.compile()
rules.each do |rule|
	print rule.lhs.show() + ' = ' + rule.rhs.show() + "\n"
end