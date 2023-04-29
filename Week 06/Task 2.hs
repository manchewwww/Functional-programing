main :: IO()
main = do
    print $ dominates (\x -> x + 1) (\x -> x + 2) [1, 2, 3, 4, 5] == False
    print $ dominates (\x -> x * 3) (\x -> x + 2) [1, 2, 3, 4, 5] == True

dominates :: (Ord a, Num a) => (a -> a) -> (a -> a) -> [a] -> Bool
dominates f g = foldl (\ acc x -> acc && abs (f x) >= abs (g x)) True

dominates' f g = all (\ x -> abs (f x) >= abs (g x))