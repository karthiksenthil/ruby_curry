# ruby_curry

ruby_curry is a framework to study the compilation and execution of [Curry](http://www-ps.informatik.uni-kiel.de/currywiki/) programs. The name stems from the fact that compiler and object code are both ruby programs.  The main tool of this framework converts definitional trees into object code.  This object code is then executed by ruby to produce the value of a Curry expression.  The framework is incomplete, but structured to be incrementally extended to a full compiler/interpreter.  Since the object code is ruby code, the efficiency of execution is not a primary goal of this project.

This tool is the result of a [project](https://www.google-melange.com/gsoc/project/details/google/gsoc2015/karthiksenthil/5700735861784576) developed by Karthik Senthil under Google Summer of Code 2015 program and mentorship of Prof. S. Antoy at [Portland State University](http://summer.cs.pdx.edu/).

## Usage

The current implementation of the compiler assumes that the input encodes the definitional trees of some Curry functions and the declarations of some Curry types.  This [example](https://github.com/karthiksenthil/DefinitionalTree/blob/master/examples/append.rb) shows the format of the input.

To compile a sample Curry program, we first encode the definitional tree of each function and each data type in a ruby program using a simple domain specific language. A sample program is `append.rb` in `user` directory.

From the program directory, invoke the compiler on the sample program:
```bash
../bin/cmd.sh append
```

This creates the object code `append_objectCode.rb` in the same `user` directory. This object code can then be excuted by the command:
```bash
ruby append_objectCode.rb
```

## Running the tests

There are 2 unit tests in the `test` directory to evaluate the working of the compiler. Tests can be run by:
```bash
cd test
ruby test_append.rb
ruby test_reverse.rb
```
