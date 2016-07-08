--main = 2 =:<= 3

--main = (("ab"++"cd")++("ef"++"gh")) =:<= "abcdefgh"

--main = x =:<= [2,3,4] where x free

mylast (_++[e]) = e
main = mylast [2,3,4]