import Data.List
main :: IO()
main = do
  print $ scoreHand ["A"] == 11
  print $ scoreHand ["A","J"] == 21
  print $ scoreHand ["5","3","7"] == 15
  print $ scoreHand ["5","4","3","2","A","K"] == 25
  print $ scoreHand ["2","3"] == 5
  print $ scoreHand ["4","5","6"] == 15
  print $ scoreHand ["7","7","8"] == 22
  print $ scoreHand ["K","J","Q"] == 30
  print $ scoreHand ["A","3"] == 14
  print $ scoreHand ["A","A"] == 12
  print $ scoreHand ["A", "10", "A"] == 12
  print $ scoreHand ["A","2","A","9","9"] == 22

scoreHand :: [String] -> Int
scoreHand cards = helper (sort $ map readNumber cards) 0
 where
  helper [] result = result
  helper (x:xs) result
   | x == 11 = if result >= 11 then helper xs (result + 1) else helper xs (result + 11) 
   | otherwise = helper xs (result + x)
   
readNumber :: String -> Int
readNumber "A" = 11
readNumber "J" = 10
readNumber "Q" = 10
readNumber "K" = 10
readNumber s = read s