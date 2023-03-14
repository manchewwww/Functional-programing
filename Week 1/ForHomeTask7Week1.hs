main :: IO()
main = do
    print $ growingPlant 5 2 5 == 1
    print $ growingPlant 5 2 6 == 2
    print $ growingPlant 10 9 4 == 1
    print $ growingPlant 100 10 910 == 10

growingPlant :: Int -> Int -> Int -> Int
growingPlant upSpeed downSpeed desiredHeight
 | (upSpeed < 0 || downSpeed < 0 || desiredHeight < 0 || upSpeed <= downSpeed) = error "Invalid input"
 | upSpeed >= desiredHeight = 1
 | otherwise = helper upSpeed downSpeed desiredHeight 0 0
 where
    helper upSpeed downSpeed desiredHeight days x
     | upSpeed <= downSpeed = error "Invalid input"
     | desiredHeight == x + upSpeed = (days + 1)
    helper upSpeed downSpeed desiredHeight days x = 
        if desiredHeight <= x 
        then days 
        else helper upSpeed downSpeed desiredHeight (days + 1) (x + upSpeed - downSpeed)
