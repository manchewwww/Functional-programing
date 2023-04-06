import Data.List
import Data.Char
main :: IO()
main = do
    print $ persistence 39 == (3,[27,14,4]) -- 3*9=27, 2*7=14, 1*4=4
    print $ persistence 999 == (4,[729,126,12,2]) -- 9*9*9=729, 7*2*9=126,
    print $ persistence 126 == (2,[12,2]) -- 1*2*6=12, 1*2=2
    print $ persistence 4 == (1,[4])
     
spisuc :: Int -> [Int]
spisuc num = helper (product $ map digitToInt $ show num) []
 where
    helper x xs 
     | x < 10 = reverse (x:xs)
     | otherwise = helper (product $ map digitToInt $ show x) (x:xs)
     
persistence :: Int -> (Int, [Int])
persistence num = (length (spisuc num), spisuc num)