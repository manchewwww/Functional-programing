main :: IO()
main = do
    print $ sortN 1714 == 7411
    print $ sortN 123450 == 543210
    print $ sortN 123405 == 543210
    print $ sortN 123045 == 543210
    print $ sortN 120345 == 543210
    print $ sortN 102345 == 543210
    print $ sortN 8910 == 9810
    print $ sortN 321 == 321
    print $ sortN 29210 == 92210
    print $ sortN 1230 == 3210
    print $ sortN 55345 == 55543
    print $ sortN 14752 == 75421
    print $ sortN 329450 == 954320
    print $ sortN 9125 == 9521

sortN :: Int -> Int
sortN number = helper number 0
 where
    helper 0 power = 0
    helper num power = ((theBiggestNum (div num 10) (mod num 10)) * (10^power)) + helper (removeFistOccurrence num (theBiggestNum (div num 10) (mod num 10))) (power + 1)

theBiggestNum :: Int -> Int -> Int
theBiggestNum 0 digit = digit
theBiggestNum num digit
 | digit > mod num 10 = theBiggestNum (div num 10) (mod num 10)
 | otherwise = theBiggestNum (div num 10) digit

removeFistOccurrence :: Int -> Int -> Int
removeFistOccurrence 0 _ = 0
removeFistOccurrence number digit = helper number 0 0 False
 where
    helper 0 result _ _ = result
    helper number result power isDigit
     | mod number 10 == digit && isDigit == False = helper (div number 10) result power True
     | otherwise = helper (div number 10) (result + (10^power) * mod number 10) (power + 1) isDigit
