# name-of-compiler

[name]() is a tool to compile and execute an input [Curry](https://en.wikipedia.org/wiki/Curry_(programming_language)) program. The tool converts the program into a Definitional Tree, a hierarchical structure, which is then accordingly processed into an intermediate object code. This object code is then executed to obtain the required output of the Curry program. The compiler is completely written in Ruby.

This tool is the result of a [project](https://www.google-melange.com/gsoc/project/details/google/gsoc2015/karthiksenthil/5700735861784576) under Google Summer of Code 2015 program and mentorship of [Portland State University](http://summer.cs.pdx.edu/).

## Usage

The current implementation of the compiler assumes that the input program's definitional tree is available as in the case of this [example](https://github.com/karthiksenthil/DefinitionalTree/blob/master/examples/append.rb).

In order to compile a sample Curry program, we first define its definitional tree (`sample_program.rb`) in `user` directory.

From the tool's root directory, the commands to compile the sample program:
```bash
cd user
../bin/cmd.sh sample_program
```
This creates the object code `sample_program_objectCode.rb` in the same `user` directory. This object code can then be excuted by the command -
```bash
ruby sample_program_objectCode.rb
```

As an example for the `append.rb` example in `user` dierctory:
```bash
cd user
../bin/cmd.sh append
ruby append_objectCode.rb
```

## Running the tests

There are 2 unit tests in the `test` directory to evaluate the working of the compiler. Tests can be run by -
```bash
cd test
ruby test_append.rb
ruby test_reverse.rb
```

## Working of the compiler





