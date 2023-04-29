main :: IO()
main = do
    print $ countPalindromes 5 13 == 5 -- 6 7 8 9 11
    print $ countPalindromes 13 5 == 5 -- 6 7 8 9 11

countPalindromes :: Int -> Int -> Int
countPalindromes x y = helper (min x y) (max x y) 0
 where
    helper downBorder upperBorder counter
     | downBorder >= upperBorder = counter
     | isPalindrome (downBorder + 1) = helper (downBorder + 1) upperBorder (counter + 1)
     | otherwise = helper (downBorder + 1) upperBorder counter

isPalindrome :: Int -> Bool
isPalindrome n = rev n == n

rev :: Int -> Int
rev n = helper n 0
 where
    helper :: Int -> Int -> Int
    helper 0 result = result
    helper leftover result = helper (div leftover 10) (result * 10 + mod leftover 10)