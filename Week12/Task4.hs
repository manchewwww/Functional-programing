main :: IO()
main = do
    print $ isSymmetric Nil == True
    print $ isSymmetric t3 == False
    print $ isSymmetric t4 == True
    print $ isSymmetric t5 == True

