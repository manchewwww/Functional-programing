import Data.Char
main :: IO()
main = do
    print $ getPrimesLC 1 100 == [7,17,37,47,67,71,73,79,97]
    print $ getPrimesLC 100 1 == [7,17,37,47,67,71,73,79,97]

    print $ getPrimesHOF 1 100 == [7,17,37,47,67,71,73,79,97]
    print $ getPrimesHOF 100 1 == [7,17,37,47,67,71,73,79,97]

getPrimesHOF :: Int -> Int -> [Int] 
getPrimesHOF x y = filter (\x -> isPrime x && isContain x 7) [min x y .. max x y]

getPrimesLC :: Int -> Int -> [Int]
getPrimesLC x y =  [x | x <- [min x y .. max x y], isPrime x, isContain x 7]

isPrime :: Int -> Bool
isPrime x = x > 1 && null [d | d <- [2 .. x - 1], mod x d == 0]

isContain :: Int -> Int -> Bool
isContain x d = elem d (map digitToInt $ show x)
