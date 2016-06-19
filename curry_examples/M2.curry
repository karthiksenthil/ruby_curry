module M2 where

data Color = Red | Blue 

other Red Blue = Red
other Red Red  = Red
other Blue Red  = Red
other Blue Blue  = Blue

const = Red

