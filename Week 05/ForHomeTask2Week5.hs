main :: IO()
main = do
    print $ getPalindromes 132465 == 8
    print $ getPalindromes 654546 == 8
    print $ getPalindromes 100001 == 100012
    print $ getPalindromes 21612 == 21614
    print $ getPalindromes 26362 == 26364

getPalindromes :: Int -> Int
getPalindromes x = helper (palindrom x)
 where
    helper xs = minimum xs + maximum xs

palindrom :: Int -> [Int]
palindrom y = [x | x <- [2 .. y], isPalindrome x, mod y x == 0 ]

isPalindrome :: Int -> Bool
isPalindrome n = read (reverse (show n)) == n

