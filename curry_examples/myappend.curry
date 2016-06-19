data MyList = Nil | Cons Int MyList

append Nil ys = ys
append (Cons x xs) ys = Cons x (append xs ys)

l1 = Cons 1 (Cons 2 Nil)
l2 = Cons 3 (Cons 4 Nil)

main = append l1 l2
