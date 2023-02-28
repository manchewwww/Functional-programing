main :: IO()
main = do
    print $ fibRec 11 == 89
    print $ fibIter 11 == 89
    print $ fibIter 110 == 43566776258854844738105

fibIter :: Integer -> Integer
fibIter x = helper x 0 1
 where
    helper 0 x1 _ = x1
    helper 1 _ x2 = x2
    helper size x1 x2 = helper (size - 1) x2 (x1 + x2)

fibRec :: Int -> Int
fibRec 0 = 0
fibRec 1 = 1
fibRec x = fibRec(x - 1) + fibRec(x - 2)

