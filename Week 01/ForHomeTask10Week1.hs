main :: IO()
main = do
    print $ finalGrade 3 4 4 4.25 4.50 3.75 4.25 5 4.25 == 4.34
    print $ finalGrade 6 6 6 4.50 5 4.50 4.75 5 4.75    == 4.95
    print $ finalGrade 6 0 4 6 6 5 4.75 6 4.75          == 5.14
    print $ finalGrade 4.25 0 3 2 0 0 0 0 0             == 2
    print $ finalGrade 5.50 6 6 6 5.50 5.25 4 5.50 4    == 5.05
    print $ finalGrade 6 6 6 5.50 5.50 4 5 5.50 5       == 5.25
    print $ finalGrade 6 6 6 5.25 6 4 4 5.63 3.50       == 4.84

finalGrade :: Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double
finalGrade d1 d2 d3 kz1 kz2 kt1 kt2 iz it
 | (d1 < 0 || d2 < 0 || d3 < 0 || kz1 < 0 || kz2 < 0 || kt1 < 0 || kt2 < 0 || iz < 0 || it < 0) = error "Invalid input"
 | ((d1 + d2 + d3) / 3.00) < 3 = 2
 | ((kz1 + kz2) / 2) < 3.00 = 2
 | ((kt1 + kt2) / 2) < 3.00 = 2
 | it < 3.00 = 2
 | iz < 3.00 = 2
--  | otherwise helper ((d1 + d2 + d3) / 3.00) ((kz1 + kz2) / 2) kz1 kz2 ((kt1 + kt2) / 2) kt1 kt2 iz it 0
 | otherwise = helper (((fromIntegral 1) / (fromIntegral 2)) * (((fromIntegral 1) / (fromIntegral 4)) 
 * ((d1 + d2 + d3) / 3.00) + ((fromIntegral 3) / (fromIntegral 8)) * ((kt1 + kt2) / 2) + ((fromIntegral 3) / (fromIntegral 8)) 
 * ((kz1 + kz2) / 2)) + (((fromIntegral 1) / (fromIntegral 4)) * it) + (((fromIntegral 1) / (fromIntegral 4)) * iz))
     where
        helper marks = if marks >= 3 then (fromIntegral $ round $ marks * 100) / 100 else 2
        -- helper d kz kz1 kz2 kt kt1 kt2 iz it marks 
        --  | (kz >= 4.5 && kz1 >= 4 && kz2 >= 4) = iz = kz
        --  | (kt >= 4.5 && kt1 >= 4 && kt2 >= 4) = it = kt
        --  | otherwise = marks = (((fromIntegral 1) / (fromIntegral 2)) * (((fromIntegral 1) / (fromIntegral 4)) * (d / 3.00) + ((fromIntegral 3) / (fromIntegral 8)) * (kt / 2) + ((fromIntegral 3) / (fromIntegral 8)) * (kz / 2)) + (((fromIntegral 1) / (fromIntegral 4)) * it) + (((fromIntegral 1) / (fromIntegral 4)) * iz))