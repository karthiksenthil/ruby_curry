data Color = Red | Green | Blue
data Mylist = Nil | Cons Color Mylist

ndinsert x Nil = Cons x Nil
ndinsert x (Cons y ys) = Cons x (Cons y ys) ? Cons y (ndinsert x ys)

permute Nil = Nil
permute (Cons x xs) = ndinsert x (permute xs)

main = permute (Cons Blue (Cons Red (Cons Green Nil)))