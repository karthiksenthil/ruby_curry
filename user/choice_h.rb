require_relative '../src/compiler/definitional_tree.rb'
require_relative '../src/compiler/curry_module.rb'
require_relative '../src/runtime/lib/boolean.rb'

# stack to store replacements
$stack = []

$true_symbol.token_value = 4
$false_symbol.token_value = 5
$or_symbol = Operation.new("or",2,nil)
$choice_symbol = Choice.new


def make_choice(x,y)
	return Box.new(Application.new($choice_symbol,[x,y]))
end

def make_or(x,y)
	return Box.new(Application.new($or_symbol,[x,y]))
end


def print_stack
	while !$replacement_stack.empty?
		r = $replacement_stack.pop
		puts r[:old].show() + "*"*9 + r[:new].show()
	end
end


def $choice_symbol.H(expr)
	left_argument = expr.content.arguments[0]

	case left_argument.content.symbol.token
	when CHOICE, OPERATION
		# first argument is another CHOICE or OPERATION ; simplify it
		left_argument.H()
		expr.replace(left_argument.content)
	else
		# first argument is a CONSTRUCTOR or FAIL
		expr.replace(left_argument.content)
	end
	expr
end


def $or_symbol.H(expr)
	
	inductive_arg1 = expr.content.arguments[0]

	case inductive_arg1.content.symbol.token
	when VARIABLE
		raise "Handling Variables not implemented yet"
	when CHOICE
		# call H on CHOICE to replace x?y with x
		inductive_arg1.H()
		expr.H()
	when 4 
		expr.replace(make_true.content)
	when 5 
		second_arg = expr.content.arguments[1]
		
		case second_arg.content.symbol.token
		when VARIABLE
			raise "Handling Variables not implemented yet"
		when CHOICE
			# call H on CHOICE to replace x?y with x
			second_arg.H()
			expr.H()
		when 4
			expr.replace(make_true.content)
		when 5
			expr.replace(make_false.content)
		when OPERATION
			second_arg.H()
			expr.H()
		end

	when OPERATION
		inductive_arg1.H()
		expr.H()
	end
	expr
end

# test = make_or(make_or(make_false,make_false),make_true)
test = make_or(make_or(make_false,make_false),make_choice(make_true,make_false))
test.H().show()
# print_stack

check_for_choices(test)

puts test.show()



def check_for_choices(expr)
	
end
