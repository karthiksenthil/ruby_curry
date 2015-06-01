require_relative '../src/definitional_tree.rb'

# Example to construct definitonal tree for the rules representing
# the append operation(on lists or arrays)

# Rules:
# General rule -> append xs ys
# 1. append [] ys = ys
# 2. append (z:zs) ys = z:(append zs ys)


# Symbols in the rules
@append_symbol = XSymbol.new("append",2,:oper)
@nil_list_symbol = XSymbol.new("[]",0,:ctor)
@cons_symbol = XSymbol.new(":",2,:ctor)

# Variables in the rules
@xs = Variable.new("xs")
ys = Variable.new("ys")
z = Variable.new("z")
zs = Variable.new("zs")

# child1 i.e rule1 ; lhs = pattern and rhs = expression
lhs1 = Application.new(@append_symbol,[@nil_list_symbol,ys])
rhs1 = ys	
child1 = Leaf.new(lhs1,rhs1)

# child2 i.e rule2
# (z:zs) itself is another sub-pattern which is built using the : symbol
lhs2 = Application.new(@append_symbol,[Application.new(@cons_symbol,[z,zs]),ys])
# similarly (append zs ys)
rhs2 = Application.new(@cons_symbol,[z,Application.new(@append_symbol,[zs,ys])])
child2 = Leaf.new(lhs2,rhs2)

# definitional tree for above rules

rootpatt = Application.new(@append_symbol,[@xs,ys])
append_tree = Branch.new(rootpatt,@xs,[child1,child2])
append_tree.pretty_print()
print "\n"
