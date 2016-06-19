# ruby_curry

ruby_curry is a framework to study the compilation and execution of [Curry](http://www-ps.informatik.uni-kiel.de/currywiki/) programs. The name stems from the fact that the runtime environment and the object code are ruby programs.  A front-end, coded in Curry, produces an abstract representation of Curry programs suitable for compilation in an imperative/object-oriented language. This representation is converted into an abstract Ruby program and then into concreted Ruby code which is executed by the Ruby interpreter.  Since the object code is in Ruby, the efficiency of execution is not a primary goal of this project.

This tool is the result of a on-going [project](https://summerofcode.withgoogle.com/projects/#4517222395412480) developed by Karthik Senthil under Google Summer of Code 2016 program and mentorship of Prof. S. Antoy at [Portland State University](http://psu-gsoc-2016.blogspot.in/).

## Usage

To compile a sample Curry program, we first translate it into an "imperative" representation called ICurry

`curry2icur file`

Then we translate this representation into ruby

`icur2ruby file`

And finally we execute it

`exec file`

There are scripts to automate the entire compilation pipeline.

## Current state

Curry is a large, general-purpose language.  Not all Curry constructs
are currently supported and many external library functions are not
yet coded.  However, simple programs compile and run as expected.

Completing support for all Curry constructs is within reach.

## Running the tests

The tests can be run with the following Rake command

`rake test`

The tests require the following Ruby gems  - [minitest](https://github.com/seattlerb/minitest), [colorize](https://rubygems.org/gems/colorize/versions/0.7.7)

