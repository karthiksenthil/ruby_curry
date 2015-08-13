require 'test/unit'

class TestAppend < Test::Unit::TestCase

	def test_append
		Dir.chdir("examples")
		`../bin/cmd.sh append`
		require_relative '../user/append_objectCode.rb'
		# input is append(true,false)
		output = main.show()

		assert_equal("cons(true,cons(false,nil_list))",output,"List append test failed")

	end

end