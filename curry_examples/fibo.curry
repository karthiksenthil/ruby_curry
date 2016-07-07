
fib n | n < 2 = n
      | n > 1 = fib (n-1) + fib (n-2)

fibinf = help 0 1
       where help x y = x : help y (x+y)

main = take 5 (map fib [0..]) == take 5 fibinf

