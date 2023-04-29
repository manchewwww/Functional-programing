main ::IO()
main = do
    -- you may get slightly different results eg. -1.047619047619100 on test 4 <- not a problem
    print $ calcSeriesSum 1 0 == -2.0 -- x = 1, n = 0
    print $ calcSeriesSum 1 1 == -0.6666666666666667
    print $ calcSeriesSum 1 2 == -1.2000000000000002
    print $ calcSeriesSum 1 3 == -1.047619047619048
    print $ calcSeriesSum 1 4 == -1.0814814814814817
    print $ calcSeriesSum 1 5 == -1.0753246753246755
    print $ calcSeriesSum 1 6 == -1.0762718762718764

calcSeriesSum :: Int -> Int -> Double
calcSeriesSum x 0 = (-2)
calcSeriesSum x n 
 | x < 0 || n < 0 = error "Invalid input"
 | otherwise = helper (-2) 0 4 3 5
  where
    helper result power divisibleCoef denominator multiplicate
     | power == n = result 
     |otherwise = helper (result + (fromIntegral(-1)^(power)) * (fromIntegral(divisibleCoef) * fromIntegral(x^(power + 1))) 
     / fromIntegral(denominator)) (power + 1) (divisibleCoef * 2) (denominator * multiplicate) (multiplicate  + 2)