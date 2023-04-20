main :: IO()
main = do
    print $ prefixToSuffix [1, 3, 6, 10, 15] == [15, 14, 12, 9, 5]
    print $ prefixToSuffix [1, 3, 6, 10, 15] == [15, 14, 12, 9, 5]
    print $ prefixToSuffix [0] == [0]
    print $ prefixToSuffix [-1, -2, -3, -4, -5] == [-5, -4, -3, -2, -1]
    print $ prefixToSuffix [1, -4, 2, 90, 100, -1] == [-1, -2, 3, -3, -91, -101]
    print $ prefixToSuffix [1, 0, 1, 0, 1, 0, 1, 0] == [0, -1, 0, -1, 0, -1, 0, -1]
    print $ prefixToSuffix [0, 0, 0, 0, 0, 0, 0, 0, 0, 1] == [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    print $ prefixToSuffix [0, 0, 0, 0, 0, 0, 1, 1, 1, 1] == [1, 1, 1, 1, 1, 1, 1, 0, 0, 0]

generateList :: (Num a) => a -> [a] -> [a]
generateList fElem xs = take (length xs) (fElem : xs)

prefixToSuffix :: (Num a) => [a] -> [a]
prefixToSuffix xs = generateList (last xs) (helper xs (last xs))
 where
    helper [] _ = []
    helper (x:xs) lastElem = (lastElem - x) : helper xs lastElem
