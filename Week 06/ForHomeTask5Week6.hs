main :: IO()
main = do
    print $ (liesOn (line (0,0) (1,1))) (0.5, 0) == False
    print $ (liesOn (line (0,0) (1,1))) (5.5, 5.5) == True
    
type Point = (Double, Double)

line :: Point -> Point -> (Double -> Double)
line (x1, y1) (x2, y2) = (\ x -> y1 + ((x - x1) * (y2 - y1)) / (x2 - x1))

liesOn :: (Double -> Double) -> (Point -> Bool)
liesOn f = (\ (p1,p2) -> f p1 == p2)


