-- Task 1
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

-- Task 2
main :: IO()
main = do
  print $ getNthSevenlikeNum 1 == 1
  print $ getNthSevenlikeNum 2 == 7
  print $ getNthSevenlikeNum 3 == 8 
  print $ getNthSevenlikeNum 4 == 49
  print $ getNthSevenlikeNum 5 -- 50 
  print $ getNthSevenlikeNum 6 -- 56
  print $ getNthSevenlikeNum 7 -- 57
  print $ getNthSevenlikeNum 8 -- 343
  print $ getNthSevenlikeNum 9 -- 344
  print $ getNthSevenlikeNum 10 -- 350
  print $ getNthSevenlikeNum 11 -- 351
  print $ getNthSevenlikeNum 12 -- 392
  print $ getNthSevenlikeNum 13 -- 393
  print $ getNthSevenlikeNum 14 -- 399
  print $ getNthSevenlikeNum 15 -- 400
  print $ getNthSevenlikeNum 16 -- 2401
  print $ getNthSevenlikeNum 31 -- 2801
  print $ getNthSevenlikeNum 32 -- 16087

getNthSevenlikeNum :: Int -> Int
getNthSevenlikeNum 1 = 1
getNthSevenlikeNum count
 | count < 1 = error "Error. Invalid input"
 | otherwise = helper 0 (binaryNum count) 0
  where
    helper result 0 _ = result
    helper result binary power = helper (result + 7^power * (mod binary 10)) (div binary 10) (power + 1)

binaryNum :: Int -> Int
binaryNum newNum = helper 0 0 newNum
 where
   helper result _ 0 = result
   helper result power newNum = helper (result + (mod newNum 2) * 10^power) (power + 1) (div newNum 2)
