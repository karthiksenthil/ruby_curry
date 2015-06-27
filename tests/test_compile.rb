require_relative '../src/compile.rb'
require_relative 'append.rb'
require 'test/unit'

class TestCompile < Test::Unit::TestCase

	def test_list_append
		#expected ouput of compile on append example
		# H(append([],[])) = []
		# H(append([],:(_v1,_v2))) = :(_v1,_v2)
		# H(append([],ys)) = H(ys)
		# H(append(:(z,zs),ys)) = :(z,append(zs,ys))
		# H(append(xs,ys)) = H(append(H(xs),ys))

		rule1_lhs = H.new(make_append(make_nil,make_nil))
		rule1_rhs = make_nil
		rule1 = Rule.new(rule1_lhs,rule1_rhs)

		rule2_lhs = H.new(make_append(make_nil,make_cons(make_variable("_v1","temporary_variable"),make_variable("_v2","temporary_variable"))))
		rule2_rhs = make_cons(make_variable("_v1","temporary_variable"),make_variable("_v2","temporary_variable"))
		rule2 = Rule.new(rule2_lhs,rule2_rhs)

		rule3_lhs = H.new(make_append(make_nil,$ys))
		rule3_rhs = H.new($ys) 
		rule3 = Rule.new(rule3_lhs,rule3_rhs)

		rule4_lhs = H.new(make_append(make_cons($z,$zs),$ys))
		rule4_rhs = make_cons($z,make_append($zs,$ys))
		rule4 = Rule.new(rule4_lhs,rule4_rhs)

		rule5_lhs = H.new(make_append($xs,$ys))
		rule5_rhs = H.new(make_append(H.new($xs),$ys))
		rule5 = Rule.new(rule5_lhs,rule5_rhs)

		expected_rules = [rule1,rule2,rule3,rule4,rule5]

		# Note : $rules contains the output rules produced by append.rb

		# explicitly done to identify which particular rule failed
		# (0..4).each do |i|
		# 	assert_equal($rules[i],expected_rules[i],"Compile procedure failed on append example")
		# end
		puts $rules[0].show
		print expected_rules[0].inspect

	end

end