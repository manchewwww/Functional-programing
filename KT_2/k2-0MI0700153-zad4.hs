main :: IO ()
main = do
    print $ controller "" == ""
    print $ controller ".........." == "0000000000"
    print $ controller "P...." == "12345"
    print $ controller "P.P.." == "12222"
    print $ controller "..P...O..." == "0012343210"
    print $ controller "P......P......" == "12345554321000"
    print $ controller "P.P.P...." == "122234555"
    print $ controller ".....P.P........P...." == "000001222222222234555"
    print $ controller ".........." == "0000000000"
    print $ controller "P.." == "123"
    print $ controller "P...." == "12345"
    print $ controller "P......P......" == "12345554321000"
    print $ controller "P.P.." == "12222"
    print $ controller "P.P.P...." == "122234555"
    print $ controller ".....P.P........P...." == "000001222222222234555"
    print $ controller ".....P......P.P..P...." == "0000012345554333321000"
    print $ controller "P.O...." == "1210000"
    print $ controller "P......P.O...." == "12345554345555"
    print $ controller "P..OP..P.." == "1232222100"
    print $ controller "P......P..OP..P..." == "123455543233334555"
    print $ controller "..P...O....." == "001234321000"

controller :: String -> String
controller [] = ""
controller input = controller' 1 1 input 0 -- Starting with direction 1 (opening)

controller' :: Int -> Int -> String -> Int -> String
controller' _ _ [] count = ""
controller' pos dir (x:xs) count
  | x == 'P' = show pos ++ controller' (calculatePosition pos dir) dir xs (count + 1)
  | x == 'O' = show pos ++ controller' (calculatePosition pos (reverseDirection dir)) dir xs (count + 1)
  | otherwise = if count == 0 then show (pos - 1) ++ controller' pos dir xs count else show pos ++ controller' (pos + 1) dir xs count

calculatePosition :: Int -> Int -> Int
calculatePosition pos dir
  | dir == 0 = max 0 (pos - 1)
  | dir == 1 = min 5 (pos + 1)
  | otherwise = pos

reverseDirection :: Int -> Int
reverseDirection dir
  | dir == 0 = 1
  | dir == 1 = 0
  | otherwise = dir

