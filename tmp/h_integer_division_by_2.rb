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

# expression constructors with Box wrapper
def make_zero
	return Box.new(Application.new($zero_symbol,[]))
end

def make_succ(x)
	return Box.new(Application.new($s_symbol,[x]))
end

def make_half(x)
	return Box.new(Application.new($half,[x]))
end


# definition of the H function 
class Half_symbol < XSymbol

	# note that H can be run only on a Box object
	def H(expr)
		
		# puts expr.show()
		first_arg = expr.content.arguments[0] # first argument of Application(Box)

		case first_arg.content.symbol.token
		when VARIABLE
			raise "Handling Variables not implemented yet"
		when CHOICE
			raise "Handling Choice not implemented yet"
		when OPERATION
			# case is half(half(...)) ==> half(H(half(...))) ; check 1 for old code
			first_arg.H()
			expr.H()

		when ZERO
			expr.replace(make_zero.content)
		when SUCC
			s_arg = first_arg.content.arguments[0] # argument of outer S (Box)

			case s_arg.content.symbol.token
			when VARIABLE
				raise "Handling Variables not implemented yet"
			when CHOICE
				raise "Handling Choice not implemented yet"
			when OPERATION
				# case is half(s(half(...))) ==> half(s(H(half(...)))); check 2 for old code
				s_arg.H()
				expr.H()

			when ZERO
				expr.replace(make_zero.content)
			when SUCC
				x3 = s_arg.content.arguments[0]
				expr.replace(make_succ(make_half(x3)).content)
			end

		end # end of outer case

		expr

	end

end


# symbols in the example
$half = Half_symbol.new("half",1,OPERATION)
$zero_symbol = XSymbol.new("0",0,ZERO)
$s_symbol = XSymbol.new("s",1,SUCC)

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
# test4 half(half(s(s(s(s(zero))))))
test4 = make_half(make_half(make_succ(make_succ(make_succ(make_succ(make_zero))))))

print first.H().show() + "\n"
print third.H().show() + "\n"
# print fourth.H().show() + "\n"
print test.H().show() + "\n"
print test2.H().show() + "\n"
print test3.H().show() + "\n"
print test4.H().show() + "\n"



# Old code:
# 1
# replaced_args = expr.arguments.map{|arg| arg == first_arg ? tmp : arg}
# return Application.new(expr.symbol,replaced_args).H()

#2
# replaced_args = first_arg.arguments.map{|arg| arg == s_arg ? tmp : arg}
# replaced_first_arg = Application.new(first_arg.symbol,replaced_args)
# replaced_expr_args = expr.arguments.map{|arg| arg == first_arg ? replaced_first_arg : arg}
# return Application.new(expr.symbol,replaced_expr_args).H()
