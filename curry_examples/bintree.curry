module bintree where

data Bintree x = Leaf | Branch x (Bintree x) (Bintree x)

isin _ Leaf = False
isin x (Branch y l r) = x==y || isin x l || isin x r

main = isin 20 (Branch 30 Leaf Leaf)
