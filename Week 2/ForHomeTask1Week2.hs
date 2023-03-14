main :: IO()
main = do
    -- print $ countDigitsIter (-13) -- error "n was negative"
    print $ countDigitsIter 12345 == 5
    print $ countDigitsIter 123 == 3

    -- print $ countDigitsRec (-13) -- error "n was negative"
    print $ countDigitsRec 12345 == 5
    print $ countDigitsRec 123 == 3

countDigitsRec :: Int -> Int
countDigitsRec 0 = 0
countDigitsRec n 
 | n < 0 = error "n was negative"
 | otherwise = 1 + countDigitsRec (div n 10)

countDigitsIter :: Int -> Int
countDigitsIter n 
 | n < 0 = error "n was negative"
 | otherwise = helper n 0
  where
    helper 0 digits = digits
    helper n digits = helper (div n 10) (digits + 1)