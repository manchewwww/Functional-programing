main :: IO()
main = do
    print $ snail 3 2 1 == 2
    print $ snail 10 3 1 == 5
    print $ snail 10 3 2 == 8
    print $ snail 100 20 5 == 7
    print $ snail 5 10 3 == 1

snail :: Int -> Int -> Int -> Int

snail heightOfColumns distancePerDay slidesDownForNight
 | (heightOfColumns < 0 || distancePerDay < 0  || slidesDownForNight < 0 || distancePerDay <= slidesDownForNight) = 
        error "Invalid input"
 | distancePerDay >= heightOfColumns = 1
 | otherwise = helper heightOfColumns distancePerDay slidesDownForNight 0 0
 where
    helper heightOfColumns distancePerDay slidesDownForNight days distance
     | heightOfColumns == distance + distancePerDay = (days + 1)
    helper heightOfColumns distancePerDay slidesDownForNight days distance = 
        if heightOfColumns <= distance 
        then days 
        else helper heightOfColumns distancePerDay slidesDownForNight (days + 1) (distance + distancePerDay - slidesDownForNight)
