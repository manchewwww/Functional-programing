main :: IO()
main = do
    -- print $ sumDigitsIter (-13) -- error "n was negative"
    print $ sumDigitsIter 12345 == 15
    print $ sumDigitsIter 123 == 6

sumDigitsIter :: Int -> Int
sumDigitsIter n 
 | n < 0 = error "n was negative"
 | otherwise = helper n 0
  where
    helper 0 result = result
    helper n result = helper (div n 10) (result + mod n 10)