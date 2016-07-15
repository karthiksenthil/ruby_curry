length [] = 0
length (x:xs) = 1 + length xs

mycond True expr = expr

main = mycond (length x == 3) x where x free
