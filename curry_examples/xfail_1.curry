list = [True,True,False,True,False,False]

pick [] = Nothing
pick (True:xs) = Just True ? pick xs
pick (False:xs) = pick xs

main = pick list
