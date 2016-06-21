require 'minitest'
require 'minitest/autorun'
require 'colorize'

class TestPositivePrograms < Minitest::Test

  def test_positives
    basedir = `dirname $(readlink -f $0)`.chomp

    all_progs = `ls #{basedir}/curry_examples/ | egrep '\.curry'`.split

    # TODO : support for logging compiler output

    obtained_matches = {}
    expected_matches = {}
    all_progs.each do |prog|
      # puts "Started test on #{prog}"
      #load expected output
      expected_output_file = "#{basedir}/curry_examples/" + 
                              File.basename(prog,".curry") + ".output"

      if File.exist?(expected_output_file)
        expected_matches[prog] = true
        #compile curry to icur
        `#{basedir}/bin/curry2icur -q #{basedir}/curry_examples/#{prog}`
        #convert icur to ruby object code
        `#{basedir}/bin/icur2ruby -q #{basedir}/curry_examples/#{prog}`
        #execute object code and save output
        obt_output = `#{basedir}/bin/exec #{basedir}/curry_examples/#{prog}`

        if $?.exitstatus == 0
          #program executed successfully
          exp_output = File.open(expected_output_file).read()
          if exp_output == obt_output
            obtained_matches[prog] = true
            print ".".green
          else
            obtained_matches[prog] = false
            print ".".red
            `echo "#{obt_output}" > /tmp/#{prog}.tmp`
            puts "\n#{prog} test failed."
            puts `diff /tmp/#{prog}.tmp #{expected_output_file}`
          end
        else
          obtained_matches[prog] = false
          puts "\n#{prog} execution fails"
        end

      else
        puts "\nExpected output file for #{prog} not found"
      end                        
      
    end

    assert_equal(expected_matches,obtained_matches,"Positive programs test failed.")
  end

end

