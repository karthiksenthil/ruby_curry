-- import bintree
-- there is a main in bintree already

data Bintree x = Leaf | Branch x (Bintree x) (Bintree x)

-- circular structure, cannot be printed as of Jun 21, 2016
example_fill =
  let x = Branch 11 (Branch 12 Leaf y) Leaf 
      y = Branch 13 (Branch 14 x Leaf) Leaf 
  in x

main = example_fill
