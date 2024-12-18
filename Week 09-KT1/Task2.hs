import Data.List

main :: IO()
main = do
    -- print $ getMaxPair $ countOccurrences "1854770768947198621219013"
    -- print $ (aroundFib 50) 5
    print $ (aroundFib 100) 25 == [('1',3)]
    print $ (aroundFib 180) 25 == [('1',5),('7',3)]
    print $ (aroundFib 1700) 25 == [('1',4),('2',5),('0',6),('4',5),('5',7),('2',4),('6',7),('3',5),('0',4),('8',5),('4',5),('4',4),('7',7),('7',6),('2',2)]
    print $ (aroundFib 500) 42 == [('0',6),('2',7),('2',6)]
    print $ (aroundFib 6000) 242 == [('5',31),('8',33),('8',31),('7',35),('7',31),('4',7)]

fibIter :: Integer -> Integer
fibIter n = helper 0 1 n
 where
    helper n0 n1 0 = n0
    helper n0 n1 1 = n1
    helper n0 n1 leftover = helper n1 (n0 + n1) (leftover - 1)

countOccurrences xs = map (\ ys -> (head ys, length ys)) $ group $ sort xs

breakDown :: Int -> String -> [String]
breakDown k leftover
 | k > length leftover = [leftover]
 | otherwise = take k leftover : breakDown k (drop k leftover)

getMaxPair :: [(Char, Int)] -> (Char, Int)
getMaxPair gs = head [pair | pair@(number, freq) <- gs, freq == maxFreq] 
 where
    maxFreq = maximum $ map snd gs

aroundFib :: aroundFib :: Integer -> (Int -> [(Char, Int)])
aroundFib n = (\ k -> map (\ gs -> getMaxPair $ countOccurrences gs) $ breakDown k (show $ fibIter n))