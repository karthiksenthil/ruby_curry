#/bin/sh

BASE=$(dirname $(dirname $(readlink -f $0)))

if [ "$1" = "" ]
then
  echo Warning: no file given
  exit
fi

FILE=`pwd`/$(basename $1 ".rb")

ruby $BASE/src/compiler/compiler.rb $FILE


