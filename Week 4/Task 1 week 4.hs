main :: IO()
main = do
    print $ hasElementsPM [] == False
    print $ hasElementsPM [1, 2, 3] == True

    print $ hasElementsFunc [] == False
    print $ hasElementsFunc [1, 2, 3] == True

    print $ hasElementsButWithMagic [] == False
    print $ hasElementsButWithMagic [1, 2, 3] == True

hasElementsButWithMagic :: [Int] -> Bool
hasElementsButWithMagic = not . null

hasElementsFunc :: [Int] -> Bool
hasElementsFunc xs = not $ null xs
-- hasElementsFunc xs = length xs > 0

hasElementsPM :: [Int] -> Bool
hasElementsPM [] = False
hasElementsPM _ = True