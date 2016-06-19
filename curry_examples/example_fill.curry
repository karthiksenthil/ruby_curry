import bintree

example_fill =
  let x = Branch 11 (Branch 12 Leaf y) Leaf 
      y = Branch 13 (Branch 14 x Leaf) Leaf 
  in x
