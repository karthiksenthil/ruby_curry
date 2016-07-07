-- example of let recursive

evens u = let y = map (u +) x
              x = 0 : y
           in x

main = take 5 (evens 2)

-- take5 (x1:x2:x3:x4:x5:_) = [x1,x2,x3,x4,x5]
