import Data.Char
main :: IO()
main = do 
    print $ sumSpecialPrimes 5 2 == 392 -- n = 5, d = 2
    print $ sumSpecialPrimes 5 3 == 107
    print $ sumSpecialPrimes 10 3 == 462

sumSpecialPrimes:: Int -> Int -> Int
sumSpecialPrimes n d = sum $ take n $ filter (\ n -> isPrime n && isContainDigit n d ) [1 .. ]

isPrime :: Int -> Bool
isPrime x = x > 1 && null [d | d <- [2 .. x - 1], mod x d == 0]

isContainDigit :: Int -> Int -> Bool
isContainDigit 0 _ = False
isContainDigit number digit = mod number 10 == digit || isContainDigit (div number 10) digit