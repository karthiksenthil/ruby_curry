-- import bintree
-- there is a main in bintree already

data Bintree x = Leaf | Branch x (Bintree x) (Bintree x)

root_left (Branch x l r) = x : root_right l
root_right (Branch x l r) = x : root_left r

-- circular structure, cannot be printed as of Jun 21, 2016
example_fill =
  let x = Branch 11 (Branch 12 Leaf y) Leaf 
      y = Branch 13 (Branch 14 Leaf x) Leaf 
  in x

main = take 8 (root_left example_fill)
