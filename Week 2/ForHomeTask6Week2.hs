main :: IO()
main = do
    print $ isInteresting 410 == True
    print $ isInteresting 212 == False
    print $ isInteresting 567 == False
    print $ isInteresting 70 == True 
    print $ isInteresting 5 == True 
    print $ isInteresting 4 == True 

isInteresting :: Int -> Bool
isInteresting n = mod n (sumDigitsIter n) == 0

sumDigitsIter :: Int -> Int
sumDigitsIter n = helper n 0
 where
    helper 0 result = result
    helper n result
     | n < 0 = error "n was negative"
     | otherwise = helper (div n 10) (result + mod n 10)