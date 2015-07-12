require_relative '../src/utilities.rb'
require_relative './append.rb'

require 'test/unit'

class TestFindPath < Test::Unit::TestCase
	def test_find_path

		# append(xs,ys) ==> [1]
		expr1 = make_append($xs,$ys)
		assert_equal(expr1.content.find_path($xs.content),[1],"find_path on expression 1 failed")

		# append(append(xs,ys),[]) ==> [1,1]
		expr2 = make_append(make_append($xs,$ys),make_nil)
		assert_equal(expr2.content.find_path($xs.content),[1,1],"find_path on expression 2 failed")

		# append(append(ys,append(xs,ys)),[]) ==> [1,2,1]
		expr3 = make_append(make_append($ys,make_append($xs,$ys)),make_nil)
		assert_equal(expr3.content.find_path($xs.content),[1,2,1],"find_path on expression 3 failed")


	end
end