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

In first stage of the compilation pipeline, we perform a set of translations
to convert input Curry code into abstractions which can be then interpreted
by the ruby_curry kernel for further stages. These abstractions are
intermediate i.e. one cannot execute or interpret them directly to get the
expected output of the Curry program.

This unit comprises of 2 intermediate asbtractions before converting Curry
to Ruby object code :
* ICurry
* RCurry

A clearer insight into the path taken by the translator is given by the image
below.

![alt text](https://github.com/karthiksenthil/ruby_curry/blob/master/docs/images/translation_pipeline.png "Pipeline for translator unit")

#### ** RCurry ** ####

RCurry is an abstraction layer over the ICurry format. It is an in-memory
abstraction, meaning, it is created and processed directly by program without
any intermediate files.