main :: IO()
main = do
    print $ getAreas [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == [78.53981633974483,11.25,113.30000000000001,9.127927385194024,6283.185307179587]
    print $ maxArea [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == Cylinder 20.0 30.0  

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show, Eq)



maxArea :: (Ord a, Floating a) => [Shape a] -> Shape a
maxArea (x:xs) = foldl (\acc b -> if area acc > area b then acc else b) x xs
-- maxArea (x:xs) = helper xs x (area x)
--  where
--     helper [] maxElement result = maxElement
--     helper (x:xs) maxElement result
--      | area x > result = helper xs x (area x)
--      | otherwise = helper xs maxElement result


area :: (Floating a) => Shape a -> a
area (Circle r) = pi * r^2
area (Rectangle a b) = a * b
area (Triangle a b c) = sqrt(sum [a, b, c] / 2.0 * (sum [a, b, c] / 2.0 - a) * (sum [a, b, c] / 2.0 - b) * (sum [a, b, c] / 2.0 - c))
area (Cylinder r h) = 2 * pi * r * h + 2 * pi * r * r

getAreas :: (Floating a) => [Shape a] -> [a]
getAreas [] = []
getAreas xs = (area (head xs)) : (getAreas (tail xs))
-- getAreas xs = helper xs []
--  where
--     helper [] result = reverse result
--     helper xs result = helper (tail xs) ((area (head xs)) : result)
