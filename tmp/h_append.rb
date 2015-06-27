require_relative '../src/expressions.rb'

# rules for H function
# H(append([],[])) = []
# H(append([],:(_v1,_v2))) = :(_v1,_v2)
# H(append([],ys)) = H(ys)
# H(append(:(z,zs),ys)) = :(z,append(zs,ys))
# H(append(xs,ys)) = H(append(H(xs),ys))

# token for constructors
XNIL = CONSTRUCTOR
CONS = XNIL + 1

# expression constructors
def make_append(x,y)
	return Box.new(Application.new($append_symbol,[x,y]))
end

def make_nil
	return Box.new(Application.new($nil_symbol,[]))
end

def make_cons(x,y)
	return Box.new(Application.new($cons_symbol,[x,y]))
end


class Append_symbol < XSymbol

	def H(expr)
		first_arg = expr.content.arguments[0] # first argument of expr in Box
		
		case first_arg.content.symbol.token
		when VARIABLE
			raise "Handling Variables not implemented yet"
		when CHOICE
			raise "Handling Choice not implemented yet"
		when OPERATION
			tmp = first_arg.H()
			first_arg.replace(tmp.content)
			return expr.H()

		when XNIL
			second_arg = expr.content.arguments[1] # second argument of expr in Box

			case second_arg.content.symbol.token
			when VARIABLE
				raise "Handling Variables not implemented yet"
			when CHOICE
				raise "Handling Choice not implemented yet"
			when OPERATION
				tmp = second_arg.H()
				second_arg.replace(tmp.content)
				return expr.H()
			
			when XNIL
				return make_nil
			when CONS
				cons_first_arg = second_arg.content.arguments[0] # these 2 args will also be a Box object
				cons_second_arg = second_arg.content.arguments[1]
				return make_cons(cons_first_arg,cons_second_arg)
				# possible shortcut for this code
				# return second_arg	
			end 

		when CONS
			z = first_arg.content.arguments[0]
			zs = first_arg.content.arguments[1]
			ys = expr.content.arguments[1]
			return make_cons(z,make_append(zs,ys))
		end

	end


end




$append_symbol = Append_symbol.new("append",2,OPERATION)
$nil_symbol = XSymbol.new("[]",0,XNIL)
$cons_symbol = XSymbol.new(":",2,CONS)

if $constructors_hash["list"].nil?
	$constructors_hash["list"] = [$nil_symbol,$cons_symbol]
else
	$constructors_hash["list"] += [$nil_symbol,$cons_symbol]
end

# Variables
xs = make_variable("xs","list")
ys = make_variable("ys","list")

# test1 append([],[])
test1 = make_append(make_nil,make_nil)
puts test1.H().show()

# test2 append(xs,ys)
test2 = make_append(xs,ys)
# puts test2.H().show()

# test3 append([],ys)
test3 = make_append(make_nil,ys)
# puts test3.H().show()

# test4 append(append([],[]),:(xs,ys))
test4 = make_append(make_append(make_nil,make_nil),make_cons(xs,ys))
puts test4.H().show()


# Old code
#1
# replaced_args = expr.arguments.map{|arg| arg == first_arg ? tmp : arg}
# return Application.new(expr.symbol,replaced_args).H()

#2
# replaced_args = expr.arguments.map{|arg| arg == second_arg ? tmp : arg}
# return Application.new(expr.symbol,replaced_args).H()	
