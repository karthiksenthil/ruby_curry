require 'minitest'
require 'minitest/autorun'
require 'colorize'

class TestPositivePrograms < Minitest::Test

  def test_positives
    basedir = `dirname $(readlink -f $0)`.chomp

    failing_progs = ['addition.curry','bintree.curry','casecolor.curry',
                      'example_fill.curry','fibo.curry','letrec.curry']
    all_progs = `ls #{basedir}/curry_examples/ | egrep '\.curry'`.split

    passing_progs = all_progs - failing_progs

    # TODO : support for logging compiler output

    obtained_matches = {}
    expected_matches = {}
    passing_progs.each do |prog|
      # puts "Started test on #{prog}"
      expected_matches[prog] = true
      #compile curry to icur
      `#{basedir}/bin/curry2icur -f #{basedir}/curry_examples/#{prog}`
      #convert icur to ruby object code
      `#{basedir}/bin/icur2ruby -f #{basedir}/curry_examples/#{prog}`
      #execute object code and save output
      obt_output = `#{basedir}/bin/exec #{basedir}/curry_examples/#{prog}`.chomp

      #load expected output
      expected_output_file = "#{basedir}/curry_examples/" + 
                              File.basename(prog,".curry") + ".output"
      
      if File.exist?(expected_output_file)
        exp_output = File.open(expected_output_file).read()
        obtained_matches[prog] = exp_output == obt_output
        print ".".green
      else
        puts "\nExpected output file for #{prog} not found"
        obtained_matches[prog] = false
        print ".".red
      end
    end

    assert_equal(expected_matches,obtained_matches,"Positive programs test failed.")
  end

end

