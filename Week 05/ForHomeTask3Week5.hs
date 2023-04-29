main :: IO()
main = do
    print $ isArithmentic [3] == True
    print $ isArithmentic [3, 5] == True
    print $ isArithmentic [1, 2, 3, 4, 5] == True
    print $ isArithmentic [3, 5, 7, 9, 11] == True
    print $ isArithmentic [3, 5, 8, 9, 11] == False

isArithmentic :: [Int] -> Bool
isArithmentic xs = length xs < 3 ||  xs!!1 - xs!!0 == xs!!2 - xs!!1 && isArithmentic (tail xs)
-- isArithmentic [] = True
-- isArithmentic [x] = True
-- isArithmentic [x,y] = True
-- isArithmentic (x:y:z:xs) = (x - y) == (y - z) && isArithmentic (y:z:xs)