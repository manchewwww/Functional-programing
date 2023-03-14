main :: IO()
main = do
    print $ removeD 1 656 == 656
    print $ removeD 5 656 == 66
    print $ removeD 6 656 == 5
    print $ removeD 0 606 == 66
    print $ removeD 0 600 == 6
    print $ removeD 6 600 == 0
    print $ removeD 2 1234 == 134

removeD :: Int -> Int -> Int
removeD d num = helper (rev num) 0
 where
    helper 0 result = result
    helper newNum  result
     | mod newNum 10 == d = helper (div newNum 10) result
     | otherwise = helper (div newNum 10) (result * 10 + mod newNum 10)

rev :: Int -> Int
rev n = helper n 0
 where
    helper :: Int -> Int -> Int
    helper 0 result = result
    helper leftover result = helper (div leftover 10) (result * 10 + mod leftover 10)