require_relative '../tmp/new_compile.rb'
require_relative './append.rb'
require 'test/unit'
require 'pathname'

class TestNewCompile < Test::Unit::TestCase

	def test_list_append
		# run the new_compile method on append definitional tree
		main($append_tree)
		# needs a better test/assertion
		created_file = File.exist?("./tmp/new_compile_output/append_h.rb") # assuming the tests are run from ROOT dir
		assert(created_file,"Output file was not created, error in new_compile")

		if(created_file)
			require_relative "../tmp/new_compile_output/append_h.rb"
		end

		test1 = make_append(make_nil,make_nil)
		test1.H()
		assert_equal(test1.show(),make_nil.show(),"Test 1 on append example failed")		

		test2 = make_append($xs,$ys)
		exception = assert_raise(RuntimeError){test2.H()}
		assert_equal("Handling Variables not implemented yet",exception.message,"Test 2 on append example failed")

		test3 = make_append(make_nil,$ys)
		exception = assert_raise(RuntimeError){test3.H()}
		assert_equal("Handling Variables not implemented yet",exception.message,"Test 3 on append example failed")

		test4 = make_append(make_append(make_nil,make_nil),make_cons($xs,$ys)) #=> :(xs,ys)
		test4.H()
		assert_equal(test4.show(),make_cons($xs,$ys).show(),"Test 4 on append example failed")

		test5 = make_append(make_append(make_nil,make_cons($xs,$ys)),make_nil) #=> :(xs,append(ys,[]))
		test5.H()
		assert_equal(test5.show(),make_cons($xs,make_append($ys,make_nil)).show(),"Test 5 on append example failed")

	
	end

end

