import Data.Char
main :: IO ()
main = do
    print $ closestToAverage [(Temp 1 23.6), (Temp 6 24.2), (Temp 11 24.2), (Temp 16 21.2), (Temp 21 23.8), (Temp 26 26.5), (Temp 31 24.5)] 

data Measuring = Temp Int Float

average xs = sum xs / (fromIntegral $ length xs)

closestToAverage :: [Measuring] -> Int
closestToAverage ts = fst $ foldr1 (\ p1@(_, t1) p2@(_, t2) -> if t1 < t2 then p1 else p2) avgTemps
 where
    avgTemps = [(day, abs $ avrg - monthlyAvgT) | (Temp day avrg) <- ts]
    monthlyAvgT = average [t | (Temp _ t) <- ts]




-- main :: IO ()
-- main = do
--     print $ closestToAverage [(Temp 1 23.6), (Temp 6 24.2), (Temp 11 24.2), (Temp 16 21.2), (Temp 21 23.8), (Temp 26 26.5), (Temp 31 24.5)]

-- data Measuring = Temp Int Float

-- closestToAverage :: [Measuring] -> Int
-- closestToAverage measurings =
--     let averageTemp = calculateAverageTemperature measurings
--         closestDay = findClosestDay averageTemp measurings
--     in closestDay

-- calculateAverageTemperature :: [Measuring] -> Float
-- calculateAverageTemperature measurings =
--     let sumTemperatures = sum [temp | Temp _ temp <- measurings]
--         numMeasurements = fromIntegral (length measurings)
--     in sumTemperatures / numMeasurements

-- findClosestDay :: Float -> [Measuring] -> Int
-- findClosestDay _ [] = error "Empty list of measurements"
-- findClosestDay avgTemp measurings =
--     let (closestDay, _) = foldl findClosest (0, abs (avgTemp - temperature (head measurings))) measurings
--         findClosest (closest, minDiff) (Temp day temp) =
--                 let diff = abs (avgTemp - temp)
--                 in if diff < minDiff
--                     then (day, diff)
--                     else (closest, minDiff)
--     in closestDay

-- temperature :: Measuring -> Float
-- temperature (Temp _ temp) = temp


