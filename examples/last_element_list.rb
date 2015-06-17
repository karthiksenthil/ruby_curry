require_relative '../src/definitional_tree.rb'
require_relative '../src/compile.rb'

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

# Symbols
last_symbol = XSymbol.new("last",1,:oper)
condition_symbol = XSymbol.new("cond",2,:oper)
constrained_equal = XSymbol.new("=:=",2,:oper)
success_symbol = XSymbol.new("success",1,:ctor)

# Variables
x = Variable.new("x")

# definitional tree for last operation
last_tree_rootlhs = Application.new(last_symbol,[@xs])
last_tree_rootrhs = Application.new(condition_symbol,[Application.new(constrained_equal,
											[Application.new(@append_symbol,[@xs,Application.new(@cons_symbol,[x,Application.new(@nil_list_symbol,[])])]),@xs]),x])

last_tree_rootnode = Leaf.new(last_tree_rootlhs,last_tree_rootrhs)
last_tree_rootnode.pretty_print()
print "\n"

print "\nOutput of compile function on definitional tree\n"

rules = last_tree_rootnode.compile()
rules.each do |rule|
	print rule.lhs.show() + ' = ' + rule.rhs.show() + "\n"
end


# definitional tree for condition operation

cond_lhs1 = Application.new(condition_symbol,[Application.new(success_symbol,[]),@ys])
cond_rhs1 = @ys
child1 = Leaf.new(cond_lhs1,cond_rhs1)

cond_tree_rootpatt = Application.new(condition_symbol,[@xs,@ys])
cond_tree_rootnode = Branch.new(cond_tree_rootpatt,@xs,[child1])
cond_tree_rootnode.pretty_print()
print "\n"

print "\nOutput of compile function on definitional tree\n"

rules = cond_tree_rootnode.compile()
rules.each do |rule|
	print rule.lhs.show() + ' = ' + rule.rhs.show() + "\n"
end


