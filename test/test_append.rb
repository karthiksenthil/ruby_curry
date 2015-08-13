require 'test/unit'

class TestAppend < Test::Unit::TestCase

	def test_append
		# below line is needed if tests are run from BASE directory
		# Dir.chdir("test")
		`../bin/cmd.sh append`
		require_relative './append_objectCode.rb'
		# input is append(true,false)
		output = main.show()

		assert_equal("cons(true,cons(false,nil_list))",output,"List append test failed")

	end

end