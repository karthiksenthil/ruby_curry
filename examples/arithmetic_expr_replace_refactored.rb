require_relative '../src/definitional_tree.rb'
require_relative '../src/generate_h.rb'

# Example to construct definitonal tree for the rules representing
# the replace function on arithmetic expressions
# link http://www-ps.informatik.uni-kiel.de/smap/smap.cgi?browser/21

# General rule : replace e1 p e2
# 1. replace e1 [] e2 = e2
# 2. replace (Add l r) (1:v) x = Add (replace l v x) r
# 3. replace (Add l r) (2:v) x = Add l (replace r v x)
# 4. replace (Mul l r) (1:v) x = Mul (replace l v x) r
# 5. replace (Mul l r) (2:v) x = Mul l (replace r v x)

# tokens for constructors
ADD = CONSTRUCTOR 					#4
MUL = ADD+1									#5
XNIL = MUL+1								#6
CONS = XNIL+1								#7
INT_ONE = CONS+1						#8
INT_TWO = INT_ONE+1					#9
BLANK_EXP = INT_TWO+1				#10
LIT = BLANK_EXP+1						#11
VAR = LIT+1 								#12
OTHER_INT = VAR+1 					#13

# Symbols in the rules
$arithmetic_replace_symbol = XSymbol.new("arithmetic_replace",3,OPERATION)
$add_symbol = XSymbol.new("add",2,ADD)
$mul_symbol = XSymbol.new("mul",2,MUL)
$nil_list_symbol = XSymbol.new("nil_list",0,XNIL)
$cons_symbol = XSymbol.new("cons",2,CONS)
$int_one_symbol = XSymbol.new("int_one",0,INT_ONE)
$int_two_symbol = XSymbol.new("int_two",0,INT_TWO)
$blank_symbol = XSymbol.new("blank",0,BLANK_EXP)
$lit_symbol = XSymbol.new("lit",1,LIT)
$var_symbol = XSymbol.new("var",1,VAR)
$other_int_symbol = XSymbol.new("other_int",0,OTHER_INT)

if $constructors_hash["integer"].nil?
	$constructors_hash["integer"] = [$int_one_symbol,$int_two_symbol,$other_int_symbol]
else
	$constructors_hash["integer"] += [$int_one_symbol,$int_two_symbol,$other_int_symbol]
end

if $constructors_hash["unknown"].nil?
	$constructors_hash["unknown"] = [$blank_symbol]
else
	$constructors_hash["unknown"] += [$blank_symbol]
end

if $constructors_hash["arithmetic expressions"].nil?
	$constructors_hash["arithmetic expressions"] = [$lit_symbol,$var_symbol,$add_symbol,$mul_symbol]
else
	$constructors_hash["arithmetic expressions"] += [$lit_symbol,$var_symbol,$add_symbol,$mul_symbol]
end

if $constructors_hash["list"].nil?
	$constructors_hash["list"] = [$nil_list_symbol,$cons_symbol]
else
	$constructors_hash["list"] += [$nil_list_symbol,$cons_symbol]
end

# expression constructors/helpers
def make_replace(x,y,z)
	return Box.new(Application.new($arithmetic_replace_symbol,[x,y,z]))
end

def make_add(x,y)
	return Box.new(Application.new($add_symbol,[x,y]))
end

def make_mul(x,y)
	return Box.new(Application.new($mul_symbol,[x,y]))
end

def make_nil_list
	return Box.new(Application.new($nil_list_symbol,[]))
end

def make_cons(x,y)
	return Box.new(Application.new($cons_symbol,[x,y]))
end

def make_int(num)
	case num
	when 1
		return Box.new(Application.new($int_one_symbol,[]))
	when 2
		return Box.new(Application.new($int_two_symbol,[]))	
	end
end

def make_blank
	return Box.new(Application.new($blank_symbol,[]))
end

def make_lit(x)
	return Box.new(Application.new($lit_symbol,[x]))
end

def make_var(x)
	return Box.new(Application.new($var_symbol,[x]))
end

def make_other_int
	return Box.new(Application.new($other_int_symbol,[]))
end

# Variables in the rules
e1 = make_variable("e1","arithmetic expressions")
p = make_variable("p","list")
e2 = make_variable("e2","arithmetic expressions")
u = make_variable("u","integer")
v = make_variable("v","list")
l = make_variable("l","arithmetic expressions")
r = make_variable("r","arithmetic expressions")

# Lit type - exempt node
lit_exempt_patt = make_replace(make_lit(make_blank),make_cons(u,v),e2)
lit_exempt = Exempt.new(lit_exempt_patt)

# Var type - exempt node
var_exempt_patt = make_replace(make_var(make_blank),make_cons(u,v),e2)
var_exempt = Exempt.new(var_exempt_patt)

# Add leaf1 - rule 2
add_leaf1_lhs = make_replace(make_add(l,r),make_cons(make_int(1),v),e2)
add_leaf1_rhs = make_add(make_replace(l,v,e2),r)
add_leaf1 = Leaf.new(add_leaf1_lhs,add_leaf1_rhs)

# Add leaf2 - rule 3
add_leaf2_lhs = make_replace(make_add(l,r),make_cons(make_int(2),v),e2)
add_leaf2_rhs = make_add(l,make_replace(r,v,e2))
add_leaf2 = Leaf.new(add_leaf2_lhs,add_leaf2_rhs)

# Add exempt
add_exempt_patt = make_replace(make_add(l,r),make_cons(make_other_int,v),e2)
add_exempt = Exempt.new(add_exempt_patt)

# Add type - branch node
add_branch_patt = make_replace(make_add(l,r),make_cons(u,v),e2)
add_branch = Branch.new(add_branch_patt,u,[add_leaf1,add_leaf2,add_exempt])

# Mul leaf1 - rule 4
mul_leaf1_lhs = make_replace(make_mul(l,r),make_cons(make_int(1),v),e2)
mul_leaf1_rhs = make_mul(make_replace(l,v,e2),r)
mul_leaf1 = Leaf.new(mul_leaf1_lhs,mul_leaf1_rhs)

# Mul leaf2 - rule 5
mul_leaf2_lhs = make_replace(make_mul(l,r),make_cons(make_int(2),v),e2)
mul_leaf2_rhs = make_mul(l,make_replace(r,v,e2))
mul_leaf2 = Leaf.new(mul_leaf2_lhs,mul_leaf2_rhs)

# Mul exempt
mul_exempt_patt = make_replace(make_mul(l,r),make_cons(make_other_int,v),e2)
mul_exempt = Exempt.new(mul_exempt_patt)

# Mul(tiply) type - branch node
mul_branch_patt = make_replace(make_mul(l,r),make_cons(u,v),e2)
mul_branch = Branch.new(mul_branch_patt,u,[mul_leaf1,mul_leaf2,mul_exempt])

# branch 1
branch1_patt = make_replace(e1,make_cons(u,v),e2)
branch1 = Branch.new(branch1_patt,e1,[lit_exempt,var_exempt,add_branch,mul_branch])

# leaf 1 i.e rule 1
leaf1_lhs = make_replace(e1,make_nil_list,e2)
leaf1_rhs = e2
leaf1 = Leaf.new(leaf1_lhs,leaf1_rhs)

# root node for replace
replace_rootpatt = make_replace(e1,p,e2)
replace_rootnode = Branch.new(replace_rootpatt,p,[leaf1,branch1])

# if __FILE__ == $0
# 	replace_rootnode.pretty_print()
# 	print "\n"

# 	print "\nOutput of new compile function on definitional tree\n"
# 	main(replace_rootnode)
# end

Evaluate_tree.new(replace_rootnode).print_in_ruby
