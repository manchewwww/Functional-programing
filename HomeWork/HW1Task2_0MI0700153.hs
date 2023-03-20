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

-- getNthSevenlikeNum :: Int -> Int
-- getNthSevenlikeNum 1 = 1
-- getNthSevenlikeNum count = helper 0 (7^(powOfTwo count)) (powOfTwo count)
--  where 
--     helper pow result maxPower
--      | count < 0 = error "Invalid input"
--      | pow == maxPower = result
--      | isPowOfTwo count = 7^maxPower
--      | otherwise = helper (pow + 1) (result + 7^pow) maxPower

-- isPowOfTwo :: Int -> Bool
-- isPowOfTwo x = helper 0 
--  where
--     helper power
--      | 2^power == x = True
--      | 2^power > x = False
--      | otherwise = helper (power + 1)

-- powOfTwo :: Int -> Int
-- powOfTwo count = helper 0 
--  where
--     helper power
--      | 2^power == count = power
--      | 2^power > count = (power - 1)
--      | otherwise = helper (power + 1)
