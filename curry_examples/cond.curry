f x y z | x || y = z
        | otherwise = not z

main =  (f True False True, f False False False)

