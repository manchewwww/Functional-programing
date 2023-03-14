main :: IO()
main = do
    print $ countOccurences 121 1 == 2
    print $ countOccurences 222 1 == 0
    print $ countOccurences 0 0 == 1

countOccurences :: Int -> Int -> Int
countOccurences 0 0 = 1
countOccurences 0 _ = 0
countOccurences n digit = helper n 0
 where
    helper 0 counter = counter
    helper n counter
     | (mod n 10) == digit = helper (div n 10) (counter + 1)
     | otherwise = helper (div n 10) counter 