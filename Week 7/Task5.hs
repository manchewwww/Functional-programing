-- Define a function that accepts a natural number greater than 1
-- and returns a sorted list of prime factors
-- the product of which gives the number.

main :: IO()
main = do
    print $ factorize 152 == [2, 2, 2, 19]
    print $ factorize 123 == [3, 41]
    print $ factorize 13 == [13]

factorize :: Int -> [Int]
factorize n = helper 2 n
 where
    helper d 1 = []
    helper d leftover
     | mod leftover d == 0 = d : helper d (div leftover d)
     | otherwise = helper (d + 1) leftover