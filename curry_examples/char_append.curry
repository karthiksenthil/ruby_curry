append [] ys = ys
append (x:xs) ys = x : append xs ys

main = append [chr (97),'b'] ['c','d']