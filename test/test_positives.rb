require 'minitest'
require 'minitest/autorun'
require 'colorize'
require_relative './positives_expected_output.rb'

def compare_output(op)
  return $expected_output == op
end

class TestPositivePrograms < Minitest::Test

  def test_positives
    basedir = `dirname $(readlink -f $0)`.chomp

    failing_progs = ['addition.curry','bintree.curry','casecolor.curry',
                      'example_fill.curry','fibo.curry','letrec.curry']
    all_progs = `ls #{basedir}/curry_examples/`.split

    passing_progs = all_progs - failing_progs

    # TODO : support for logging compiler output

    obtained_output = {}
    passing_progs.each do |prog|
      # puts "Started test on #{prog}"
      #compile curry to icur
      `#{basedir}/bin/curry2icur -f #{basedir}/curry_examples/#{prog}`
      #convert icur to ruby object code
      `#{basedir}/bin/icur2ruby -f #{basedir}/curry_examples/#{prog}`
      #execute object code and save output
      output = `#{basedir}/bin/exec #{basedir}/curry_examples/#{prog}`
      obtained_output[prog] = output
      print ".".green
    end

    assert_equal($expected_output,obtained_output,"Positive programs test failed.")
  end

end


