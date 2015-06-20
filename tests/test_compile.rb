require_relative '../src/compile.rb'
require_relative 'append.rb'
require 'test/unit'

class TestCompile < Test::Unit::TestCase

	def test_list_append
		#expected ouput of compile on append example
		rule1_lhs = H.new(Application.new($append_symbol,[Application.new($nil_list_symbol,[]),Application.new($nil_list_symbol,[])]))
		rule1_rhs = Application.new($nil_list_symbol,[])
		rule1 = Rule.new(rule1_lhs,rule1_rhs)

		rule2_lhs = H.new(Application.new($append_symbol,[Application.new($nil_list_symbol,[]),
										Application.new($cons_symbol,[Variable.new("_v1","temporary_variable"),Variable.new("_v2","temporary_variable")])]))
		rule2_rhs = Application.new($cons_symbol,[Variable.new("_v1","temporary_variable"),Variable.new("_v2","temporary_variable")])
		rule2 = Rule.new(rule2_lhs,rule2_rhs)

		rule3_lhs = H.new(Application.new($append_symbol,[Application.new($nil_list_symbol,[]),$ys]))
		rule3_rhs = H.new($ys) 
		rule3 = Rule.new(rule3_lhs,rule3_rhs)

		rule4_lhs = H.new(Application.new($append_symbol,[Application.new($cons_symbol,[$z,$zs]),$ys]))
		rule4_rhs = Application.new($cons_symbol,[$z,Application.new($append_symbol,[$zs,$ys])])
		rule4 = Rule.new(rule4_lhs,rule4_rhs)

		rule5_lhs = H.new(Application.new($append_symbol,[$xs,$ys]))
		rule5_rhs = H.new(Application.new($append_symbol,[H.new($xs),$ys]))
		rule5 = Rule.new(rule5_lhs,rule5_rhs)

		expected_rules = [rule1,rule2,rule3,rule4,rule5]

		# Note : $rules contains the output rules produced by append.rb

		assert_equal($rules.length(),expected_rules.length(),"Compile procedure failed on Append example")

		(0..4).each do |i|
			assert_equal($rules[i].show(),expected_rules[i].show(),"Compile procedure failed on Append example")
		end

	end

end