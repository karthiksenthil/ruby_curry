for t in $(ls test/test_*)
do
	ruby -Ilib:test $t
done