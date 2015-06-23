require_relative '../src/expressions.rb'

# output of rules from compile
# H(half(0)) = 0
# H(half(s(0))) = 0
# H(half(s(s(x3)))) = s(half(x3))
# H(half(s(x2))) = H(half(s(H(x2))))
# H(half(x1)) = H(half(H(x1)))

class Half_symbol < XSymbol

	def H(expr)
		
		first_arg = expr.arguments[0] # first argument of Application
		
		case first_arg.symbol
		when $zero_symbol	
			return Application.new($zero_symbol,[]) # rule 1
		when $s_symbol
			s_arg = first_arg.arguments[0]
			case s_arg.symbol
			when $zero_symbol
				return Application.new($zero_symbol,[]) # rule 2
			when $s_symbol
				x3 = 	s_arg.arguments[0]
				return Application.new($s_symbol,[Application.new(self,[x3])]) # rule 3
			end 
		end

	end

end


half = Half_symbol.new("half",1,:oper)
$zero_symbol = XSymbol.new("0",0,:ctor)
$s_symbol = XSymbol.new("s",1,:ctor)

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
x1 = Variable.new("x1","integer")
x2 = Variable.new("x2","integer")
x3 = Variable.new("x3","integer")


first = Application.new(half,[Application.new($zero_symbol,[])])
third = Application.new(half,[Application.new($s_symbol,[Application.new($s_symbol,[Variable.new("x3","integer")])])])
fourth = Application.new(half,[Application.new($s_symbol,[Variable.new("x2","integer")])])

# test half(s(s(s(0))))
test = Application.new(half,[Application.new($s_symbol,
														[Application.new($s_symbol,
														[Application.new($s_symbol,
														[Application.new($zero_symbol,[])])])])])


print first.H().show() + "\n"
print third.H().show() + "\n"
print test.H().show() + "\n"