main :: IO()
main = do
    print $ sumOfEvenly 1 10 == 41 -- 2+3+5+6+7+8+10
    print $ sumOfEvenly 5 20 == 175

countDivisor :: Int -> Int
countDivisor n = helper n 1 [1 .. n]
 where
    helper n result xs = length [x | x <- xs, mod n x == 0] 


sumOfEvenly :: Int -> Int -> Int
sumOfEvenly x y 
 | x < 1 || x > 1000 || y < 1 || y > 1000 = error "Invalid input"
 | otherwise = helper [min x y .. max x y]
  where
    helper xs = sum [x | x <- xs, mod (countDivisor x) 2 == 0]