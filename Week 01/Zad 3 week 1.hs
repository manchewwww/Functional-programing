main :: IO()
main = do 
    print $ factRec 11 == 39916800
    --print $ factRec (-11) -- error: x was negative
    print $ factIter 11 == 39916800
    --print $ factIter (-11) -- error: x was negative

factIter :: Int -> Int
factIter x 
 | x < 0 = error "x was negative"
 |otherwise = helper x 1
 where 
    helper 0 result = result
    helper x result = helper (x - 1) (x * result)


factRec :: Int -> Int
factRec  0 = 1
factRec x 
 | x < 0 = error "x was negative"
 | otherwise = x * factRec (x - 1)