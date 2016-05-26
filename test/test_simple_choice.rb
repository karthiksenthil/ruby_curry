# A unit test to check handling of Choice operation
# The test also verifies the working of the "backtrack" feature

require 'minitest/autorun'

def same_elements?(arr1, arr2)
	arr1.to_set == arr2.to_set
end


class TestSimpleChoice < Minitest::Test

	def test_simple_choice
		# below line is needed if tests are run from BASE directory
		Dir.chdir("test") do 
			`../bin/cmd.sh simple_choice`
			$trace = false
			$output_expressions = []
			require_relative './simple_choice_objectCode.rb'
			# input is cons(choose_rb,cons(choose_bg,nil_list))
			assert_equal($output_expressions.size,4,"Simple choice test failed")
			expected_output = ["cons(red,cons(blue,nil_list))", "cons(red,cons(green,nil_list))",
													"cons(blue,cons(blue,nil_list))","cons(blue,cons(green,nil_list))"]
			assert_equal(true, same_elements?(expected_output, $output_expressions),"Simple choice test failed")
			`rm ./simple_choice_objectCode.rb`
		end

	end

end