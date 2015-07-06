require_relative '../src/definitional_tree.rb'
# require_relative '../src/compile.rb'
require_relative '../flpcode/boolean.rb'
require_relative '../tmp/new_compile.rb'

# Example to construct definitonal tree for the rules representing
# the less than equal to operation(<=) on natural numbers

# Rules:
# General rule -> x1 <= x2
# 1. 0 <= x2 = true
# 2. s(x3) <= 0 = false
# 3. s(x3) <= s(x2) = x3<= x2

# tokens for constructor symbols
ZERO = CONSTRUCTOR
SUCC = ZERO + 1

# Symbols in the rules
$less_than_equal_symbol = XSymbol.new("<=",2,OPERATION)
$zero_symbol = XSymbol.new("0",0,ZERO)
$s_symbol = XSymbol.new("s",1,SUCC)

if $constructors_hash["integer"].nil?
	$constructors_hash["integer"] = [$zero_symbol,$s_symbol]	
else
	$constructors_hash["integer"] += [$zero_symbol,$s_symbol]
end

# if $constructors_hash["peano"].nil?
# 	$constructors_hash["peano"] = [$s_symbol]	
# else
# 	$constructors_hash["peano"] += [$s_symbol]
# end

# expression constructors
def make_less_than_equal(x,y)
	return Box.new(Application.new($less_than_equal_symbol,[x,y]))
end

def make_zero
	return Box.new(Application.new($zero_symbol,[]))
end

def make_succ(x)
	return Box.new(Application.new($s_symbol,[x]))
end


# Variables in the rules
x1 = make_variable("x1","integer")
x2 = make_variable("x2","integer")
x3 = make_variable("x3","integer")

# rule 1
lhs1 = make_less_than_equal(make_zero,x2)
rhs1 = make_true
child1 = Leaf.new(lhs1,rhs1)

# rule 2
lhs2 = make_less_than_equal(make_succ(x3),make_zero)
rhs2 = make_false
child3 = Leaf.new(lhs2,rhs2)

#rule 3
lhs3 = make_less_than_equal(make_succ(x3),make_succ(x2))
rhs3 = make_less_than_equal(x3,x2)
child4 = Leaf.new(lhs3,rhs3)


# in child2 branch node, x2 is the inductive variable
child2_patt = make_less_than_equal(make_succ(x3),x2)
child2 = Branch.new(child2_patt,x2,[child3,child4])


# definitonal tree for the above rules, in the root node x1 is the inductive variable
root_patt = make_less_than_equal(x1,x2)
root_node = Branch.new(root_patt,x1,[child1,child2])
root_node.pretty_print()
print "\n"

# print "\nOutput of compile function on definitional tree\n"

# rules = root_node.compile()
# rules.each do |rule|
# 	print rule.show() + "\n"
# end

print "\nOutput of new compile function on definitional tree\n"

main(root_node)


=begin 
Expected H function :

def H(expr)

	first_arg = expr.content.arguments[o]

	case first_arg.symbol.token
	when VARIABLE
		raise "Handling variable not implemented yet"
	when CHOICE
		raise "Handling choice not implemented yet"
	when OPERATION
		first_arg.H()
		expr.H()
	when ZERO
		expr.replace(make_true)
	when SUCC
		second_arg = expr.content.arguments[1]
		when VARIABLE
			raise "Handling variable not implemented yet"
		when CHOICE
			raise "Handling choice not implemented yet"
		when OPERATION
			second_arg.H()
			expr.H()
		when ZERO
			expr.replace(make_false)
		when SUCC
			expr.replace(make_less_than(first_arg.content.arguments[0],second_arg.content.arguments[0]).H().content)
		end
	end

end

=end
