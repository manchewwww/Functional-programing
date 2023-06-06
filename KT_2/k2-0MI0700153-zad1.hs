main :: IO()
main = do
    print $ prodOdds [1,2,3,4,5,6] == 48
    print $ prodOdds [7.66,7,7.99,7] == 49.0


prodOdds :: Num a => [a] -> a
prodOdds = foldr (\(x, xi) acc -> if odd x then xi * acc else acc) 1 . zip [0..]

-- prodOdds :: (Num a) => [a] -> a
-- prodOdds xs = product $ [x | (x, xi) <- zip xs [0 ..], mod xi 2 == 1]