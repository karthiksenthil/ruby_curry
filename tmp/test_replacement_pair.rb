require_relative '../src/expressions.rb'
require_relative './h_append.rb'

# constructors for pair example
PAIR = CONSTRUCTOR

# expression constructors
def make_pair(x,y)
	return Box.new(Application.new($pair_symbol,[x,y]))
end

# method to evaluate a pair expression
def evaluate_pair(pair)
	count = 0
	pair.content.arguments.each do |arg|
		h_arg = arg.H()
		arg.replace(h_arg.content)
		count+=1
	end
end


$pair_symbol = XSymbol.new("pair",2,PAIR)
# sample expression : append([],[])
x = make_append(make_nil,make_nil)
# make a pair : pair(x,x)
test_pair = make_pair(x,x)
evaluate_pair(test_pair)



# Expected : A runtime exception (H is not defined on a non-operation rooted expression)
# Reason : Both the arguments of test_pair is the same box x. Replacing one
# changes the other too.
# - the first replacement reduces x to []
# - the second replacemnt tries to perform H and reduce second arg which is same as
#   the resuced first arg, hence H is tried on a non-operation rooted expr([]) which is
#   an exception
