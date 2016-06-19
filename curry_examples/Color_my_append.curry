data Rainbow = Red | Orange | Yellow | Green | Blue | Indigo | Violet
data MyList = Nil | Cons Rainbow MyList

infixr 5 +::+

Nil +::+ ys = ys
(Cons x xs) +::+ ys = Cons x (xs +::+ ys)

l1 = Cons Red (Cons Orange Nil)
l2 = Cons Yellow (Cons Green Nil)
l3 = Cons Blue (Cons Indigo Nil)
l4 = Cons Violet Nil

main = l1 +::+ (l2 +::+ l3) +::+ l4
