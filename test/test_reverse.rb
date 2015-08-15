require 'test/unit'

class TestReverse < Test::Unit::TestCase

	def test_reverse
		# below line is needed if tests are run from BASE directory
		# Dir.chdir("test")
		`../bin/cmd.sh reverse`
		require_relative './reverse_objectCode.rb'
		# input is append(true,false)
		output = main.show()

		assert_equal("cons(false,cons(true,nil_list))",output,"List reverse test failed")

	end

end