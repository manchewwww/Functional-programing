main :: IO()
main = do
    print $ sumDivisibleNumbers 0 10 5 == 5
    print $ sumDivisibleNumbers 0 100 5 == 990
    print $ sumDivisibleNumbers 100 0 5 == 990
    
sumDivisibleNumbers :: Int -> Int -> Int -> Int
sumDivisibleNumbers start finish k
 | start < 0 || finish < 0 || k <= 0 = error "Invalid input"
 | otherwise = helper (min start finish) (max start finish)
  where
    helper start finish
     | start == finish = 0
     | mod (isDivisible start) k == 0 = start + helper (start + 1) finish
     | otherwise = helper (start + 1) finish

isDivisible :: Int -> Int
isDivisible 0 = 0
isDivisible x = (mod x 10) + isDivisible (div x 10)
