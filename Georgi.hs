main :: IO()
main = do
    print $ a [1,2,3,4,5,6,7,8,9,10]

a :: [Int] -> [[Int]]
a xs = [[x, y, z] | x <- xs, y <- xs, z <- xs, (x + y + z) == 10]