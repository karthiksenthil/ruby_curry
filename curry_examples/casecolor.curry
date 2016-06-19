data Color = Red | Green | Blue

next Red = Green
next Green = Blue

isRed x
  | x == Red = True
  | True = False

-- as of Jun 13, 2016, stack level too deep (SystemStackError)
main = (isRed Red, isRed (next Red))
 
