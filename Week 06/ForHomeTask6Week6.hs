main :: IO()
main = do
    print $ (getOddCompositionValue [(\x -> x + 1),(\x -> x * 2),(\x -> x - 1), (\x -> div x 2)]) 2 == 2

getOddCompositionValue :: (Num a) => [(a -> a)] -> (a -> a)
getOddCompositionValue xs = (\ x -> foldr (\function argument -> function argument) x [f | (f, i) <- zip xs [0 .. ], even i])


-- getOddCompositionValue [] = (\ x -> x)
-- getOddCompositionValue [f] = (\ x -> f x)
-- getOddCompositionValue (f1:f2:fs) = (\ x -> (getOddCompositionValue fs) (f1 x))