main :: IO()
main = do
    print $ removeFistOccurrence 15365 5 == 1536
    print $ removeFistOccurrence 15360 0 == 1536
    print $ removeFistOccurrence 15300 0 == 1530
    print $ removeFistOccurrence 15365 1 == 5365
    print $ removeFistOccurrence 35365 3 == 3565
    print $ removeFistOccurrence 1212 1 == 122
    print $ removeFistOccurrence 1212 2 == 121
    print $ removeFistOccurrence (removeFistOccurrence 1212 1) 1 == 22

removeFistOccurrence :: Int -> Int -> Int
removeFistOccurrence 0 _ = 0
removeFistOccurrence number digit = helper number 0 0 False
 where
    helper 0 result _ _ = result
    helper number result power isDigit
     | mod number 10 == digit && not isDigit = helper (div number 10) result power True
     | otherwise = helper (div number 10) (result + 10^power * mod number 10) (power + 1) isDigit