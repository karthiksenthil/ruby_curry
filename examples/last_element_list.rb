require_relative '../src/definitional_tree.rb'
require_relative '../src/compile.rb'
# require_relative '../tmp/new_compile.rb'

# Example to construct definitonal trees for a curry program
# to determine last element of a list
# Program link : http://www-ps.informatik.uni-kiel.de/smap/smap.cgi?browser/2

# 3 operations : append, last & cond

# Rules for append -
# General rule -> append xs ys
# 1. append [] ys = ys
# 2. append (z:zs) ys = z:(append zs ys)

# Rules for rev -
# General rule -> last xs
# 1. last xs = cond (append xs [x] =:= xs) x

# Rules for cond -
# General rule -> cond xs ys
# 1. cond success ys = ys

# here =:= is constained equality operator

# import the append operation's definitional tree from append.rb
require_relative 'append.rb'

# Tokens for constructors
SUCCESS = CONS + 1

# Symbols
$last_symbol = XSymbol.new("last",1,OPERATION)
$condition_symbol = XSymbol.new("condition",2,OPERATION)
$constrained_equal_symbol = XSymbol.new("constrained_equal",2,OPERATION)
$success_symbol = XSymbol.new("success",0,SUCCESS)

# expression constructors
def make_last(x)
	return Box.new(Application.new($last_symbol,[x]))
end

def make_condition(x,y)
	return Box.new(Application.new($condition_symbol,[x,y]))
end

def make_constrained_equal(x,y)
	return Box.new(Application.new($constrained_equal_symbol,[x,y]))
end

def make_success
	return Box.new(Application.new($success_symbol,[]))
end

if $constructors_hash["Success"].nil?
	$constructors_hash["Success"] = [$success_symbol]
else
	$constructors_hash["Success"] += [$success_symbol]
end

# Variables
x = make_variable("x","list")

# definitional tree for last operation
last_tree_rootlhs = make_last($xs)
# last_tree_rootrhs = Application.new(condition_symbol,[Application.new(constrained_equal,
# 											[Application.new(@append_symbol,[@xs,Application.new(@cons_symbol,[x,Application.new(@nil_list_symbol,[])])]),@xs]),x])
last_tree_rootrhs = make_condition(make_constrained_equal(make_append($xs,make_cons(x,make_nil)),$xs),x)


last_tree_rootnode = Leaf.new(last_tree_rootlhs,last_tree_rootrhs)
last_tree_rootnode.pretty_print()
print "\n"

print "\nOutput of compile function on definitional tree\n"
main(last_tree_rootnode)

# rules = last_tree_rootnode.compile()
# rules.each do |rule|
# 	print rule.lhs.show() + ' = ' + rule.rhs.show() + "\n"
# end


# definitional tree for condition operation
# "*" denotes that ys can be a Variable of any type
succ_xs = make_variable("xs","Success")
succ_ys = make_variable("ys","Success")

cond_lhs1 = make_condition(make_success,succ_ys)
cond_rhs1 = succ_ys
child1 = Leaf.new(cond_lhs1,cond_rhs1)

cond_tree_rootpatt = make_condition(succ_xs,succ_ys)
cond_tree_rootnode = Branch.new(cond_tree_rootpatt,succ_xs,[child1])
cond_tree_rootnode.pretty_print()
print "\n"

print "\nOutput of compile function on definitional tree\n"
main(cond_tree_rootnode)

# rules = cond_tree_rootnode.compile()
# rules.each do |rule|
# 	print rule.show() + "\n"
# end


