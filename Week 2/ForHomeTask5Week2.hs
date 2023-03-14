main :: IO()
main = do
    print $ areAmicable 200 300 == False
    print $ areAmicable 220 284 == True
    print $ areAmicable 284 220 == True
    print $ areAmicable 1184 1210 == True
    print $ areAmicable 2620 2924 == True
    print $ areAmicable 6232 6368 == True

areAmicable :: Int -> Int -> Bool
areAmicable x y = sumDivs x == sumDivs y 

sumDivs :: Int -> Int
sumDivs 0 = 0
sumDivs n = helper 1 
 where 
    helper d 
     | d > n = 0
     | mod n d == 0 = d + helper (d + 1)
     | otherwise = helper (d + 1)