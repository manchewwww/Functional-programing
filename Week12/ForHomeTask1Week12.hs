main :: IO ()
main = do
    print $ (myPoly [2.7, 3.0 ..]) 2.2 3 == -0.4399999999999998

myPoly :: [Double] -> (Double -> Int -> Double)
myPoly g = (\x y -> product [x - z |  z <- take y g])

-- name - myPoly?
-- parameters - list and return function with x y
-- type- [Double], Double, Int, Double
-- g x y z
-- return type - function 


