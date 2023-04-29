import Data.Char
main :: IO()
main = do
    print $ specialSum 1 100 == 195

specialSum :: Int -> Int -> Int
specialSum x y = sum [n | n <- [x .. y], elem '6' (show n), mod (n - 1) 4 == 0]
-- specialSum x y = sum [z | z <- [min x y .. max x y], k <- [1 .. (div (max x y) 4)], isContain z 6, z == (4 * k + 1)]
-- isContain :: Int -> Int -> Bool
-- isContain x d = elem d (map digitToInt $ show x)