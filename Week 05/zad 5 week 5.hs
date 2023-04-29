main :: IO()
main = do
    print $ divideNonPM (10, 5) == (2, 0)
    print $ divideNonPM (5, 10) == (0, 5)

    print $ dividePM (10, 5) == (2, 0) -- 10 / 5 = 2 and 10 % 5 = 0
    print $ dividePM (5, 10) == (0, 5) -- 5 / 10 = 0 and 5 % 10 = 5

    print $ (\ (x, y) -> (div x y, mod x y)) (10, 5) == (2, 0) -- 10 / 5 = 2 and 10 % 5 = 0
    print $ (\ (x, y) -> (div x y, mod x y)) (5, 10) == (0, 5) -- 5 / 10 = 0 and 5 % 10 = 5

type Point2D = (Int, Int)

dividePM :: Point2D -> Point2D
dividePM (x, y) = (div x y, mod x y)

divideNonPM :: Point2D -> Point2D
divideNonPM pair = (div (fst pair) (snd pair), mod (fst pair) (snd pair))