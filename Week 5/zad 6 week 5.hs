main :: IO()
main = do
    print $ normalize (4, 2) == (2, 1)
    print $ normalize (8, 4) == (2, 1)
    print $ normalize (2, 4) == (1, 2)

    print $ normalizeUsingLet (4, 2) == (2, 1)
    print $ normalizeUsingLet (8, 4) == (2, 1)
    print $ normalizeUsingLet (2, 4) == (1, 2)

type Rat a = (a, a)

normalizeUsingLet :: (Integral a) => Rat a -> Rat a
normalizeUsingLet (x, y) = let d = gcd x y in (div x d, div y d)

normalize :: (Integral a) => Rat a -> Rat a
normalize (x, y) = (div x d, div y d)
 where
    d = gcd x y