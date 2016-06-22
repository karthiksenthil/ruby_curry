require 'minitest'
require 'minitest/autorun'
require 'colorize'

if ARGV[1] == "-f"
  puts "working"
  # basedir = `dirname $(readlink -f $0)`.chomp
  # `rm -rf #{basedir}/curry_examples/.curry/*`
end

class TestPositivePrograms < Minitest::Test
  basedir = `dirname $(readlink -f $0)`.chomp
  all_tests = `ls #{basedir}/curry_examples/ | egrep '\.curry'`.split

  all_tests.each do |test|
    #compile curry to icur
    `#{basedir}/bin/curry2icur -q #{basedir}/curry_examples/#{test}`
    #convert icur to ruby object code
    `#{basedir}/bin/icur2ruby -q #{basedir}/curry_examples/#{test}`
    #execute object code and save output
    obtained_output = `#{basedir}/bin/exec #{basedir}/curry_examples/#{test}`

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

=begin

# def test_positives
    basedir = `dirname $(readlink -f $0)`.chomp

    all_progs = `ls #{basedir}/curry_examples/ | egrep '\.curry'`.split

    # TODO : support for logging compiler output

    all_progs.each do |prog|
      # puts "Started test on #{prog}"
      #load expected output
      expected_output_file = "#{basedir}/curry_examples/" + 
                              File.basename(prog,".curry") + ".output"

      if File.exist?(expected_output_file)
        #compile curry to icur
        `#{basedir}/bin/curry2icur -q #{basedir}/curry_examples/#{prog}`
        #convert icur to ruby object code
        `#{basedir}/bin/icur2ruby -q #{basedir}/curry_examples/#{prog}`
        #execute object code and save output
        obt_output = `#{basedir}/bin/exec #{basedir}/curry_examples/#{prog}`

        if $?.exitstatus == 0
          #program executed successfully
          define_method("test #{prog}") do 
            exp_output = File.open(expected_output_file).read()
            assert_equal(obt_output,exp_output,"#{prog} test failed.")
          end
          
        else
          puts "\n#{prog} execution fails"
        end

      else
        puts "\nExpected output file for #{prog} not found"
      end                        
      
    end

  # end
=end