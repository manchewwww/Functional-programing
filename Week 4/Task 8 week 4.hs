import Data.Char

main :: IO()
main = do
    print $ rev 123 == 321

    print $ fact 5 == 120

    print $ isPrime 2
    print $ isPrime 5 == True
    print $ isPrime 6 == False
    print $ isPrime 11 == True
    print $ isPrime 13 == True

    print $ sumDig 142500 == 12

    print $ sumDivs 161 == 192

sumDivs :: Int -> Int
sumDivs n = sum $ filter (\ d -> mod n d == 0) [1 .. n]

sumDig :: Int -> Int
sumDig = sum . map digitToInt . show

isPrime :: Int -> Bool
isPrime n = n > 1 && null [d | d <- [2 .. n - 1], mod n d == 0]

fact :: Int -> Int
fact n = product [1 .. n]

rev :: Int -> Int
rev = read . reverse . show
