main :: IO()
main = do
    print $ p 1 == 1
    print $ p 2 == 5
    print $ p 3 == 12
    print $ p 4 == 22
    print $ p 5 == 35
    print $ p 6 == 51

p :: Int -> Int
p n 
 | n < 0 = error "Invalid input"
 | otherwise = helper 1 1 4
  where
    helper result count div
     | count == n = result
     | otherwise = helper (result + div) (count + 1) (div + 3)