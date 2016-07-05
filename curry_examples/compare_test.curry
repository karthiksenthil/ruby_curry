t1 = compare [2,3] [2,2+3]
t2 = compare [4,6] [2,6]
t3 = compare (("ab"++"cd")++("ef"++"gh")) "abcdefgh"
t4 = compare [2,3] [2,3,6]

main = [t1,t2,t3,t4]