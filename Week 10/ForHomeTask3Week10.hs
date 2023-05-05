import Data.List
main :: IO()
main = do
    print $ getClosestDistance [(ThreeD 4 5 6), (ThreeD 2 5 10)] == (4.47213595499958,ThreeD 4.0 5.0 6.0,ThreeD 2.0 5.0 10.0)
    print $ getClosestDistance [(ThreeD 4 5 6), (ThreeD 2 5 10), (ThreeD 5 2 (-10)), (ThreeD (-2) 1 45), (ThreeD 12 0 2)] == (4.47213595499958,ThreeD 4.0 5.0 6.0,ThreeD 2.0 5.0 10.0)
    print $ getClosestDistance [(ThreeD 4 5 6), (ThreeD 2 5 10), (ThreeD 5 2 (-10)), (ThreeD (-2) 1 45), (ThreeD 12 0 2), (ThreeD 6 5 4)] == (2.8284271247461903,ThreeD 4.0 5.0 6.0,ThreeD 6.0 5.0 4.0)

    print $ getClosestDistance [(TwoD 4 6), (TwoD 5 10), (TwoD 5 29), (TwoD 1 45), (TwoD 0 2), (TwoD 69 42)] == (4.123105625617661,TwoD 4.0 6.0,TwoD 5.0 10.0)
type Vector a = (a, Point a, Point a)
data Point a = TwoD a a | ThreeD a a a
 deriving (Show, Eq, Read)

distanceBetweenPoints :: (Floating a) => Point a -> Point a -> Vector a
distanceBetweenPoints (ThreeD x y z) (ThreeD m n p) = (sqrt((m - x)^2 + (n - y)^2 + (p - z)^2), (ThreeD x y z), (ThreeD m n p)) 
distanceBetweenPoints (TwoD x y) (TwoD m n) = (sqrt $ (m - x)^2 + (n - y)^2, (TwoD x y), (TwoD m n))

getAllDistance :: (Floating a) => [Point a] -> [Vector a]
getAllDistance xs = [distanceBetweenPoints x y | [x, y] <- subsequences xs]

getClosestDistance :: (Floating a, Ord a) => [Point a] -> Vector a
getClosestDistance = foldl1 (\ x@(distance, _, _) y@(newDistance, _, _) -> if distance < newDistance then x else y) . getAllDistance