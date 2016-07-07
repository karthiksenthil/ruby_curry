-- f a1 a2 a3 a4 a5 = a1+a2+a3+a4+a5
f a1 a2 = (a1,a2)

g x = f x

h y = g 1 y

main = h 2
