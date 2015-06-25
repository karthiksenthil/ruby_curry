require_relative '../src/expressions.rb'

# output of rules from compile
# H(half(0)) = 0
# H(half(s(0))) = 0
# H(half(s(s(x3)))) = s(half(x3))
# H(half(s(x2))) = H(half(s(H(x2))))
# H(half(x1)) = H(half(H(x1)))

# Tokens for constructors in this example
ZERO = CONSTRUCTOR
SUCC = ZERO + 1

# expression constructors
def make_zero
	return Application.new($zero_symbol,[])
end

def make_succ(x)
	return Application.new($s_symbol,[x])
end

def make_half(x)
	return Application.new($half,[x])
end


# definition of the H function 
class Half_symbol < XSymbol

	def H(expr)
		
		# puts expr.show()
		first_arg = expr.arguments[0] # first argument of Application

		case first_arg.symbol.token
		when VARIABLE
			raise "Handling Variables not implemented yet"
		when CHOICE
			raise "Handling Choice not implemented yet"
		when OPERATION
			# case is half(half(...)) ==> half(H(half(...)))
			tmp = first_arg.H()
			replaced_args = expr.arguments.map{|arg| arg == first_arg ? tmp : arg}
			return Application.new(expr.symbol,replaced_args).H()
		when ZERO
			return make_zero
		when SUCC
			s_arg = first_arg.arguments[0]

			case s_arg.symbol.token
			when VARIABLE
				raise "Handling Variables not implemented yet"
			when CHOICE
				raise "Handling Choice not implemented yet"
			when OPERATION
				# case is half(s(half(...))) ==> half(s(H(half(...))))
				tmp = s_arg.H()
				replaced_args = first_arg.arguments.map{|arg| arg == s_arg ? tmp : arg}
				replaced_first_arg = Application.new(first_arg.symbol,replaced_args)
				replaced_expr_args = expr.arguments.map{|arg| arg == first_arg ? replaced_first_arg : arg}
				return Application.new(expr.symbol,replaced_expr_args).H()  
			when ZERO
				return make_zero
			when SUCC
				x3 = s_arg.arguments[0]
				return make_succ(make_half(x3))
			end

		end # end of outer casee

	end

end


# symbols in the example
$half = Half_symbol.new("half",1,:oper,OPERATION)
$zero_symbol = XSymbol.new("0",0,:ctor,ZERO)
$s_symbol = XSymbol.new("s",1,:ctor,SUCC)

if $constructors_hash["integer"].nil?
	$constructors_hash["integer"] = [$zero_symbol]	
else
	$constructors_hash["integer"] += [$zero_symbol]
end

if $constructors_hash["peano"].nil?
	$constructors_hash["peano"] = [$s_symbol]	
else
	$constructors_hash["peano"] += [$s_symbol]
end

# Variables in the rules
x1 = make_variable("x1","integer")
x2 = make_variable("x2","integer")
x3 = make_variable("x3","integer")


first = make_half(make_zero)
third = make_half(make_succ(make_succ(x3)))
fourth = make_half(make_succ(x2))

# test1 half(s(s(s(0))))
test = make_half(make_succ(make_succ(make_succ(make_zero))))
# test2 half(half(0))
test2 = make_half(make_half(make_zero))
# test3 half(succ(half(0)))
test3 = make_half(make_succ(make_half(make_zero)))


print first.H().show() + "\n"
print third.H().show() + "\n"
# print fourth.H().show() + "\n"
print test.H().show() + "\n"
print test2.H().show() + "\n"
print test3.H().show() + "\n"
