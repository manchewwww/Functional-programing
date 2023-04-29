main :: IO()
main = do
    print $ findSum 0 2 10 == 3578 -- 510 + 1022 + 2046
    print $ findSum 5 3 5 == 174 -- 26 + 50 + 98

findSum :: Int -> Int -> Int -> Int
findSum a b n
 | n <= 3 = error "Invalid input"
 | otherwise = (sumaa n b a) + (sumaa (n - 1) b a) + (sumaa (n - 2) b a)

sumaa:: Int -> Int -> Int -> Int
sumaa 0 _ s = s
sumaa n b s = sumaa (n - 1) b (s + 2^(n - 1) * b)