require_relative '../src/compile.rb'
require 'test/unit'

class TestCompile < Test::Unit::TestCase

	def test_list_append
		output = `ruby examples/append.rb`
		expected_match = output.include?("
H(append([],[])) = []
H(append([],:(_v1,_v2))) = :(_v1,_v2)
H(append([],ys)) = H(ys)
H(append(:(z,zs),ys)) = :(z,append(zs,ys))
H(append(xs,ys)) = H(append(H(xs),ys))")

		assert(expected_match,"Compile procedure failed on Append example")
	end

end