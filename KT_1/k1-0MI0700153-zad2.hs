main :: IO()
main = do  
    print $ (aroundFib 100) 25 == [('1',3)]
    print $ (aroundFib 180) 25 == [('1',5),('7',3)]
    print $ (aroundFib 1700) 25 == [('1',4),('2',5),('0',6),('4',5),('5',7),('2',4),('6',7),('3',5),('0',4),('8',5),('4',5),('4',4),('7',7),('7',6),('2',2)]
    print $ (aroundFib 500) 42 == [('0',6),('2',7),('2',6)]
    print $ (aroundFib 6000) 242 ==[('5',31),('8',33),('8',31),('7',35),('7',31),('4',7)]

aroundFib :: Integer -> (Int -> [(Char, Int)])
aroundFib n = (\k -> group (groupNum (show $ fibIter n) k))

conuntMaxOccurrences :: Int -> (Char, Int)
conuntMaxOccurrences x = 

group :: [Integer] -> [(Char, Int)]
group xs = 

groupNum :: [Char] -> Int -> [Int]
groupNum xs k = helper xs (length xs) []
 where
    helper ss len newxs
     | len < 2 * k = (read ss : newxs)
     | otherwise = helper (drop k ss) (len - k) ((read $ take k ss) : newxs)

fibIter :: Integer -> Integer
fibIter x = helper x 0 1
 where
    helper 0 x1 _ = x1
    helper 1 _ x2 = x2
    helper size x1 x2 = helper (size - 1) x2 (x1 + x2)
