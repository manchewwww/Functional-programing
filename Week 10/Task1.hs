main :: IO()
main = do
    print $ (TwoD 5 6) == TwoD 6 7
    print $ ThreeD 5 6 7 == TwoD 6 7
    print $ f "TwoD 5.2 6"

-- analog to "typedef"
type Vector = (Int, Int)
-- type String = [Char]

data Point a = TwoD a a | ThreeD a a a
 deriving (Show, Eq, Read) -- operator<<

-- f :: (Read a, Num a) => String -> Point a
-- f :: (Read a, Floating a) => String -> Point a
f :: String -> Point Double
f str = read str