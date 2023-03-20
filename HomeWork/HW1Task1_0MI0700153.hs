main :: IO()
main = do
  print $ eqSumPowDig 100 2 == 0
  print $ eqSumPowDig 1000 2 == 0
  print $ eqSumPowDig 2000 2 == 0
  print $ eqSumPowDig 200 3 == 153
  print $ eqSumPowDig 370 3 == 523
  print $ eqSumPowDig 370 3 == 523
  print $ eqSumPowDig 400 3 == 894
  print $ eqSumPowDig 500 3 == 1301
  print $ eqSumPowDig 1000 3 == 1301
  print $ eqSumPowDig 1500 3 == 1301

eqSumPowDig :: Int -> Int -> Int
eqSumPowDig hmax power 
 | hmax <= 1 || power < 0 = error "Invalid input"
 | otherwise = helper hmax 0 
  where
    helper 1 result = result
    helper hmax result 
     | hmax == specialNum hmax power = helper (hmax - 1) (result + hmax)
     | otherwise = helper (hmax - 1) result


specialNum :: Int -> Int -> Int
specialNum num pow = helper num 0
 where
    helper 0 result = result
    helper num result = helper (div num 10) (result + (mod num 10)^pow)