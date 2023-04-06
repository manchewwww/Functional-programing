import Data.List
main :: IO()
main = do
    print $ sumUnique [[1,2,3,2],[-4,-4],[5]] -- == 9 -- (= 1 + 3 + 5)
    print $ sumUnique [[2,2,2],[3,3,3],[4,4,4]] -- == 0
    print $ sumUnique [[1,2,3],[4,5,6],[7,8,9]] == 45


sumUnique :: [[Int]] -> Int
sumUnique xs = isUnique (concat xs)

isUnique :: [Int] -> Int
isUnique [] = 0
isUnique [x] = x
isUnique (x:xs)
 | oneOcurrence x xs = isUnique xs
 | otherwise = x + isUnique xs

oneOcurrence :: Int -> [Int] -> Bool
oneOcurrence _ [] = False
oneOcurrence x xs 
 | elem x xs = True
 | otherwise = False

