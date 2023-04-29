main :: IO()
main = do
    print $ sumPrimeDivs 0 == 0
    print $ sumPrimeDivs 6 == 5-- 2 + 3
    print $ sumPrimeDivs 18 == 5-- 2 + 3
    print $ sumPrimeDivs 19 == 19
    print $ sumPrimeDivs 45136 == 53

sumPrimeDivs :: Int -> Int
sumPrimeDivs 0 = 0
sumPrimeDivs n = helper n 2 0
 where
    helper n d result 
     | d > n = result
     | mod n d == 0 && isPrime d = helper n (d + 1) (result + d)
     | otherwise = helper n (d + 1) result

isPrime :: Int -> Bool
isPrime n = n > 1 && helper 2
 where
    helper d
     | d >= n = True
     | mod n d == 0 = False
     | otherwise = helper (d + 1)