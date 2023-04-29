main :: IO()
main = do
    print $ onlyArithmentic [[3], [1, 2, 3, 4, 5], [3, 5, 8, 9, 11]]  == [[3], [1, 2, 3, 4, 5]]

isAritmetic :: [Int] -> Bool
isAritmetic xs = length xs < 3 || xs == take (length xs) [xs!!0, xs!!1 ..]

onlyArithmentic ::[[Int]] -> [[Int]]
onlyArithmentic xss = [xs | xs <- xss, isAritmetic xs]