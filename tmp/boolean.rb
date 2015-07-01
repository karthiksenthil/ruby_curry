require_relative '../src/expressions.rb'

XTRUE = CONSTRUCTOR
XFALSE = XTRUE + 1

$true_symbol = XSymbol.new("true",0,XTRUE)
$false_symbol = XSymbol.new("false",0,XFALSE)

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

class Not_symbol < XSymbol
	def H(expr)
		first_arg = expr.content.arguments[0]

		case first_arg.content.symbol.token
		when VARIABLE
			raise "Handling Variables not implemented yet"
		when CHOICE
			raise "Handling Choice not implemented yet"
		when XTRUE
			return make_false
		when XFALSE
			return make_true
		when OPERATION
			tmp = first_arg.H()
			first_arg.replace(tmp.content)
			return expr.H()			
		end

	end
end

$not_symbol = Not_symbol.new("not",1,OPERATION)

class Or_symbol < XSymbol
	def H(expr)
		first_arg = expr.content.arguments[0]

		case first_arg.content.symbol.token
		when VARIABLE
			raise "Handling Variables not implemented yet"
		when CHOICE
			raise "Handling Choice not implemented yet"
		when XTRUE 
			return make_true
		when XFALSE 
			second_arg = expr.content.arguments[1]
			return second_arg.H()
		when OPERATION
			tmp = first_arg.H()
			first_arg.replace(tmp.content)
			return expr.H()
		end

	end
end

$or_symbol = Or_symbol.new("or",2,OPERATION)


# puts make_not(make_true).H().show()
puts make_or(make_false,make_not(make_true)).H().show()
