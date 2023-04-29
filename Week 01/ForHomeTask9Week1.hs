main :: IO()
main = do
    print $ rev 1 == 1
    print $ rev 123 == 321
    print $ rev 987654321 == 123456789

rev :: Int -> Int
rev x = if x < 0 then error "Invalid input" else helper x 0
 where
    helper 0 y = y
    helper x y = helper (div x 10) (y * 10 + mod x 10)