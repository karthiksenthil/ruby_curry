require_relative '../src/expressions.rb'
require_relative '../flpcode/boolean.rb'
require 'test/unit'

# constructors for pair example
PAIR = CONSTRUCTOR

# expression constructors
def make_pair(x,y)
	return Box.new(Application.new($pair_symbol,[x,y]))
end

# method to evaluate a pair expression ,alternate code to N
def evaluate_pair(pair)
	count = 0
	pair.content.arguments.each do |arg|
		h_arg = arg.H()
		arg.replace(h_arg.content)
		count+=1
	end
end

class TestReplace<Test::Unit::TestCase

	def test_pair_replace
		$pair_symbol = XSymbol.new("pair",2,PAIR)
		# sample expression : and(true,false)
		x = make_and(make_true,make_false)
		# make a pair : pair(x,x) -> 1 replacement
		test_pair = make_pair(x,x)
		# make a pair : pair(and(true,false),and(true,false)) -> 2 replacements
		# test_pair = make_pair(make_and(make_true,make_false),make_and(make_true,make_false))
		test_pair.N()

		assert_equal(1,$replacement_records.count,"Replacement functionality is not consistent")
	end
end



# Expected : A runtime exception (H is not defined on a non-operation rooted expression)
# Reason : Both the arguments of test_pair is the same box x. Replacing one
# changes the other too.
# - the first replacement reduces x to []
# - the second replacemnt tries to perform H and reduce second arg which is same as
#   the resuced first arg, hence H is tried on a non-operation rooted expr([]) which is
#   an exception