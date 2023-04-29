import Data.List

main :: IO()
main = do
    print $ numContentChildren [1, 2, 3] [1, 1] == 1
    print $ numContentChildren [1, 2] [1, 2, 3] == 2
    print $ numContentChildren [3,3,3,3,3,3,3] [17] == 1
    print $ numContentChildren [22, 1, 211] [17, 3, 24, 332] == 3

numContentChildren :: [Int] -> [Int] -> Int
numContentChildren gs ss = helper (sort gs) (sort ss)
 where
    helper (g:gs) (s:ss)
     | s >= g = 1 + helper gs ss
     | otherwise = helper (g:gs) ss
    helper _ _ = 0