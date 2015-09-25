require 'test/unit'

class TestReverse < Test::Unit::TestCase

	def test_reverse
		# below line is needed if tests are run from BASE directory
		# Dir.chdir("test")
		`../bin/cmd.sh reverse`
		require_relative './reverse_objectCode.rb'
		$trace = false
		# input is reverse(red,green,blue)
		main

		assert_equal($output_expressions.size,1,"List reverse test failed")
		output = $output_expressions[0]
		assert_equal("cons(blue,cons(green,cons(red,nil_list)))",output,"List reverse test failed")

	end

end