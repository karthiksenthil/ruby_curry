append [] ys = ys
append (x:xs) ys = x : append xs ys

main = append [1,2] [3,4]
