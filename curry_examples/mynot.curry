data myBool = myFalse | myTrue

myNot myFalse = myTrue
myNot myTrue = myFalse

main = myNot (myNot myTrue)