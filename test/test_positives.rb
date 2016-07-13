require 'minitest'
require 'minitest/autorun'
require 'colorize'

class TestPositivePrograms < Minitest::Test

  basedir = `dirname $(readlink -f $0)`.chomp
  all_tests = `ls #{basedir}/curry_examples/ | egrep '\.curry'`.split

  all_tests.each do |test|
    #compile curry to icur
    `#{basedir}/bin/curry2icur -q #{basedir}/curry_examples/#{test}`
    #convert icur to ruby object code
    `#{basedir}/bin/icur2ruby -q #{basedir}/curry_examples/#{test}`
    #execute object code and save output
    obtained_output = `timeout 2s #{basedir}/bin/exec #{basedir}/curry_examples/#{test}`

    if $?.exitstatus == 0
      #test compiled successfully
      expected_output_file = "#{basedir}/curry_examples/" + 
                                File.basename(test,".curry") + ".output"
      #check if output file exists
      if File.exist?(expected_output_file)
        define_method("test_#{test}") do
          expected_output = File.open(expected_output_file).read()
          assert_equal(expected_output, obtained_output, "#{test} failed.")
        end
      else
        puts "No reference output found for #{test}.\n"
      end
    else
      puts "#{test} execution failed.\n\n"
    end

  end

end