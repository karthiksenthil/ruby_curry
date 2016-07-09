length [] = 0
length (x:xs) = 1 + length xs

main | length x == 3 = x where x free
