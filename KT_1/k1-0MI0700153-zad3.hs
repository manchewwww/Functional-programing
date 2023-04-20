import Data.List
main :: IO()
main = do
    print $ numContentChildren [1, 2, 3] [1, 1] == 1
    print $ numContentChildren [1, 2] [1, 2, 3] == 2

numContentChildren :: [Int] -> [Int] -> Int
numContentChildren gs ss = helper (sort gs) (sort ss) 0
 where
    helper :: [Int] -> [Int] -> Int -> Int
    helper [] _ result = result
    helper _ [] result = result
    helper (g:gs) (s:ss) result
     | s >= g = helper gs ss (result + 1)
     | otherwise = helper (g:gs) ss result
