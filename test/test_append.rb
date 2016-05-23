require 'test/unit'
require 'minitest/reporters'
reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

class TestAppend < Test::Unit::TestCase

	def test_append
		# below line is needed if tests are run from BASE directory
		Dir.chdir("test") do 
			`../bin/cmd.sh append`
			$trace = false
			$output_expressions = []
			require_relative './append_objectCode.rb'	
			# input is append(true,false)
			assert_equal($output_expressions.size,1,"List append test failed")
			output = $output_expressions[0]
			assert_equal("cons(true,cons(false,nil_list))",output,"List append test failed")
			# delete the object code file here
			`rm ./append_objectCode.rb`
		end

	end

end