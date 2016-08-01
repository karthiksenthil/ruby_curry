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

#### RCurry ####

RCurry is an abstraction layer over the ICurry format. It is an in-memory
abstraction, meaning, it is created and processed directly during compile time
without any intermediate files.

RCurry represents a closer step to the expected Ruby object code for the Curry 
program and hence it can be called "the abstract syntax of the ruby object code".
The ruby_curry kernel picks up the ICurry format(.icur file) for the input Curry
code and converts it to the RCurry format. The code implementing this module is
present in `src/translator/ruby`

Description of files in directory `src/translator/ruby` :
* **RCurry.curry** : A Curry data file which defines the RCurry data structure. 
Each data object represents an easily translatable component of the expected 
object code.


* **ICurryToAbstractRuby.curry** : This Curry program is responsible for converting
ICurry to RCurry data structure. It reads from the .icur file.


* **PPRCurry.curry** : An overall Curry program to "pretty print" the expected 
Ruby object code from the RCurry format. By printing we refer to meta-programming 
of the object code which is the ultimate aim of the ruby_curry kernel.


* **PPData.curry** : A Curry program to handle "pretty printing" of data defined in
input code. It is a sub-module used by PPRCurry.


* **Utils.curry** : Some utilities used for this unit.


* **Main.curry** : The main module for this component of the kernel, combining all 
the above modules together.

