-- Да се дефинира функция kthMaxMin :: [Int] -> (Int -> Int),
-- която приема
-- списък от цели числа и връща функция с параметър
-- естествено число k – такава, че
-- оценката на израза ((kthMaxMin xs) k) e k-тото по абсолютна стойност
-- отрицателно число в xs.
-- Ако такова число не съществува, да се връща грешката “No such number”.

import Data.List

main :: IO()
main = do
    print $ (kthMaxMin [-1]) 1 == -1
    print $ (kthMaxMin [-1,-5,-6,-6,-6,-6]) 2 == -5
    print $ (kthMaxMin [1,2,3,4,-5,6,7,-2,-1,0]) 2 == -2
    -- print $ (kthMaxMin [-1,0,-1,0,-2,3,1,-1]) 3 -- error “No such number”

kthMaxMin :: [Int] -> (Int -> Int)
kthMaxMin xs = (\ k -> if length toBeIndexed >= k
    then toBeIndexed!!(k - 1)
    else error "No such number")
 where
    toBeIndexed = reverse $ sort $ nub $ filter (< 0) xs