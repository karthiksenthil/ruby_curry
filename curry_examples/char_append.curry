append [] ys = ys
append (x:xs) ys = x : append xs ys

main = append ['a','b'] ['c','d']