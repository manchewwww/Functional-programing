import Data.Char

main :: IO()
main = do
    print $ checkNumber 2728 == (4,15)
    print $ checkNumber 31415 == (12,2)
    print $ checkNumber 121 == (2,2)

checkNumber :: Int -> (Int, Int)
checkNumber num =  helper num (length $ show num) (0, 0)
 where
    helper 0 _ (x, y) = (x, y)
    helper num length (x, y)
     | mod (length - 1) 2 == 0 = helper (div num 10) (length - 1) (x + mod num 10, y)
     | otherwise = helper (div num 10) (length - 1) (x, y + mod num 10)

    -- checkNumber num = [if mod (y - 1) 2 == 0 then () | (x, y) <- zip [map digitToInt $ show num] [1 ..]]