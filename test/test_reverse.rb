require 'test/unit'
require 'minitest/reporters'
reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

class TestReverse < Test::Unit::TestCase

	def test_reverse
		# below line is needed if tests are run from BASE directory
		Dir.chdir("test") do 
			`../bin/cmd.sh reverse`
			$trace = false
			$output_expressions = []
			require_relative './reverse_objectCode.rb'
			# input is reverse(red,green,blue)
			assert_equal($output_expressions.size,1,"List reverse test failed")
			output = $output_expressions[0]
			assert_equal("cons(false,cons(cons(true,nil_list),cons(cons(true,nil_list),nil_list)))",output,"List reverse test failed")
			`rm ./reverse_objectCode.rb`
		end

	end

end