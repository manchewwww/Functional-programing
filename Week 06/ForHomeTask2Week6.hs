main :: IO()
main = do
    print $ getVolumes [(5, 10), (5, 2), (2, 10), (2, 5)] == [785.4, 157.08, 125.66, 62.83]

type Cylinder = (Double, Double)
roundToTwoDigits :: Double -> Double
roundToTwoDigits = (/100) . fromIntegral . round . (*100)
getVolumes :: [Cylinder] -> [Double]
getVolumes xs = [roundToTwoDigits (pi * r * r * h) | (r, h) <- xs]