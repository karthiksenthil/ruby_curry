data Color = Red | Green | Blue

next Red = Green
next Green = Blue

pred Blue = Green
pred Green = Red

main = pred (next Red ) ? pred (next Green) ? pred (next Blue)
