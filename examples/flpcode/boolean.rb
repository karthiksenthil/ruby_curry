require_relative '../src/expressions.rb'

XTRUE = CONSTRUCTOR
XFALSE = XTRUE + 1

$true_symbol = Constructor.new("true",0)
$false_symbol = Constructor.new("false",0)
if $constructors_hash["boolean"].nil?
	$constructors_hash["boolean"] = [$true_symbol,$false_symbol]
else
	$constructors_hash["boolean"] += [$true_symbol,$false_symbol]
end

# expression constructors
def make_true
	return Box.new(Application.new($true_symbol,[]))
end

def make_false
	return Box.new(Application.new($false_symbol,[]))
end

def make_not(x)
	return Box.new(Application.new($not_symbol,[x]))
end

def make_or(x,y)
	return Box.new(Application.new($or_symbol,[x,y]))
end

def make_and(x,y)
	return Box.new(Application.new($and_symbol,[x,y]))
end

class Not_symbol < XSymbol
	def H(expr)
		first_arg = expr.content.arguments[0]

		case first_arg.content.symbol.token
		when VARIABLE
			raise "Handling Variables not implemented yet"
		when CHOICE
			raise "Handling Choice not implemented yet"
		when XTRUE
			expr.replace(make_false.content)
		when XFALSE
			expr.replace(make_true.content)
		when OPERATION
			first_arg.H()
			expr.H()			
		end
		expr

	end
end

# $not_symbol = Not_symbol.new("not",1,OPERATION)

# expected output on running compile on OR operation
# H(or(False,True)) = True
# H(or(False,False)) = False
# H(or(False,y)) = H(y)
# H(or(True,y)) = True
# H(or(x,y)) = H(or(H(x),y))

class Or_symbol < XSymbol
	def H(expr)
		first_arg = expr.content.arguments[0]

		case first_arg.content.symbol.token
		when VARIABLE
			raise "Handling Variables not implemented yet"
		when CHOICE
			raise "Handling Choice not implemented yet"
		when XTRUE 
			expr.replace(make_true.content)
		when XFALSE 
			second_arg = expr.content.arguments[1]
			
			case second_arg.content.symbol.token
			when VARIABLE
				raise "Handling Variables not implemented yet"
			when CHOICE
				raise "Handling Choice not implemented yet"
			when XTRUE
				expr.replace(make_true.content)
			when XFALSE
				expr.replace(make_false.content)
			when OPERATION
				second_arg.H()
				expr.H()
			end

		when OPERATION
			first_arg.H()
			expr.H()
		end
		expr
	end
end

# $or_symbol = Or_symbol.new("or",2,OPERATION)

# expected output on running compile on AND operation
# H(and(True,True)) = True
# H(and(True,False)) = False
# H(and(True,y)) = H(y)
# H(and(False,y)) = False
# H(and(x,y)) = H(and(H(x),y))

class And_symbol < XSymbol
	def H(expr)
		first_arg = expr.content.arguments[0]

		case first_arg.content.symbol.token
		when VARIABLE
			raise "Handling Variables not implemented yet"
		when CHOICE
			raise "Handling Choice not implemented yet"
		when XFALSE
			expr.replace(make_false.content)
		when XTRUE
			second_arg = expr.content.arguments[1]

			case second_arg.content.symbol.token
			when VARIABLE
				raise "Handling Variables not implemented yet"
			when CHOICE
				raise "Handling Choice not implemented yet"
			when XFALSE
				expr.replace(make_false.content)
			when XTRUE
				expr.replace(make_true.content)
			when OPERATION
				second_arg.H()
				expr.H()
			end

		when OPERATION
			first_arg.H()
			expr.H()
		end
		expr

	end
end

# $and_symbol = And_symbol.new("and",2,OPERATION)



# not(true) = false
# puts make_not(make_true).N()
# or(false,or(false,not(false))) = true
# puts make_or(make_false,make_or(make_false,make_not(make_false))).H().show()
# and(or(false,true),not(and(true,true))) = false
# puts make_and(make_or(make_false,make_true),make_not(make_and(make_true,make_true))).N()