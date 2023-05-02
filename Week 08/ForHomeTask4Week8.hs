main :: IO()
main = do
    print $ getAreas [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == [78.53981633974483,11.25,113.30000000000001,9.127927385194024,6283.185307179587]
    print $ maxArea [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == Cylinder 20.0 30.0  

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show, Eq)



maxArea :: (Ord a, Floating a) => [Shape a] -> Shape a
maxArea = foldl1 (\acc b -> if area acc > area b then acc else b)
--FOR ME
-- maxArea (x:xs) = helper xs x (area x)
--  where
--     helper [] maxElement result = maxElement
--     helper (x:xs) maxElement result
--      | area x > result = helper xs x (area x)
--      | otherwise = helper xs maxElement result


area :: (Floating a) => Shape a -> a
area (Circle r) = pi * r^2
area (Rectangle x y) = x * y
area (Triangle x y z) = sqrt $ p * (p - x) * (p - y) * (p - z)
 where
    p = (x + y + z) / 2.0
area (Cylinder r h) = 2 * pi * r * h + 2 * pi * r * r

getAreas :: (Floating a) => [Shape a] -> [a]
getAreas = map area 
--FOR ME
-- getAreas xs = helper xs []
--  where
--     helper [] result = reverse result
--     helper xs result = helper (tail xs) ((area (head xs)) : result)
