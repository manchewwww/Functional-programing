main :: IO()
main = do
    print $ (pairCompose [(+1), (+2)]) 1  == 5 -- ((1 +  2) + 1) + 1
    print $ (pairCompose [(+1), (+2), (+3)]) 1 == 8


pairCompose :: (Num a) => [(a -> a)] -> (a -> a)
pairCompose [] = (\ x -> x)
pairCompose [f] = (\ x -> f x)
pairCompose (f1:f2:fs) = (\ x -> (f1 $ f2 x) + (pairCompose fs) x)
