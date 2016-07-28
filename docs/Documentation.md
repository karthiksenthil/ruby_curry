# Documentation for ruby_curry #

The purpose of this document is to describe the work accomplished so far in
terms of design, evaluation and execution. This will certainly act as a guide
to anybody who is interested in contributing to the current stage of the tool.

## Design and pipeline ##

The compilation process in ruby_curry is carried out in 3 stages :
* Translation of Curry program to intermediate abstractions
* Construction of Ruby object code from abstractions
* Execute the object code in ruby_curry's runtime environment

More details about the progress made in each of these stages is given below.

### Translation of Curry programs ###

