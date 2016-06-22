#!/bin/sh

BASEDIR=$(dirname $(dirname $(readlink -f $0)))
# echo BASEDIR $BASEDIR

TESTDIR=$BASEDIR/curry_examples

while [ $1 ]
do
    case $1 in
	-f) rm -rf $TESTDIR/.curry/*; shift;;
	-*) echo `basename $0`: ignored flag \"$1\"; shift;;
	*) break;;
    esac
done

TESTS=`ls $TESTDIR/*.curry`

for tmp in $TESTS;
do
    file=$(basename $tmp ".curry")
    echo 
    $BASEDIR/bin/curry2icur -q $TESTDIR/$file
    $BASEDIR/bin/icur2ruby -q $TESTDIR/$file
    $BASEDIR/bin/exec $TESTDIR/$file > $TESTDIR/$file.comp
    if [ "$?" = "0" ]
    then
	if [ -e $TESTDIR/$file.output ]
	then
	    OK=`diff -q $TESTDIR/$file.comp $TESTDIR/$file.output`
	    if [ "$?" != "0" -o "$OK" != "" ]
	    then
		echo "***" $file test fails
		diff $TESTDIR/$file.comp $TESTDIR/$file.output
	    else
		echo $file test passes
		rm -f $TESTDIR/$file.comp
	    fi
	else
	    echo "---" $file no reference output
	fi
    else
	echo "***" $file execution fails
    fi
done

# optionally remove differing comp files
# rm -f $TESTDIR/*.comp

exit
