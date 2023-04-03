main :: IO()
main = do
    print $ (applyN (\x -> 2 * x) 5) 2 == 64
    print $ (applyN (\x -> div x 10) 2) 100 == 1

applyN :: (Num a) => (a -> a) -> Int -> (a -> a)
applyN f 0 = (\ x -> x)
applyN f n = (\ x -> (applyN f (n - 1)) (f x))

-- applyN :: (Num a) => (a -> a) -> Int -> a -> a
-- applyN f y x = iterate f x !! y