data Color = Red | Green | Blue

next Red = Green
next Green = Blue

main = (next x, next y) where x,y free
