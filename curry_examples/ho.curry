mymap f [] = []
mymap f (x:xs) = f x : mymap f xs

pair x = (0,x)

main = mymap pair [1,2,3]
