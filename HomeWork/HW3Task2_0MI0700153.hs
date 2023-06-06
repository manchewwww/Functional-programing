import Data.List
import Data.Char
main :: IO()
main = do
    print $ simplify "1+2+x" -- == "x+3"
    print $ simplify "x+2+x-2" -- == "2x"
    print $ simplify "x+2-(x-2)" -- == "4"
    print $ simplify "y+2+x-2" -- == "x+y"
    print $ simplify "1+2+x+y+x+z+5-x-x-x+y" -- == "-x+2y+z+8"
    print $ simplify "1+2+x+y+x-(x-x-x)+z+y-10" -- =="3x+2y+z-7"
    print $ simplify "1+2-(3-(3-2))-10" -- == "-9"


simplify :: String -> String
simplify expr = removeBrackets expr []

removeBrackets :: String -> String -> String
removeBrackets [] acc = reverse acc
removeBrackets (x:xs) acc
  | x == ')' = removeBrackets xs acc
  | x == '+' && (head xs) == '(' = removeBrackets xs acc
  | x == ')' = removeBrackets xs acc
  | x == '+' && (head xs) == '(' = removeBrackets xs (x:acc)
  | x == '-' && (head xs) == '(' = removeBrackets (adjustSigns $ tail xs) (x:acc)
  | otherwise = removeBrackets xs (x:acc)

adjustSigns :: String -> String
adjustSigns [] = []
adjustSigns (x:xs)
  | x == '(' = removeBrackets xs []
  | x == '-' = '+' : adjustSigns xs
  | x == '+' = '-' : adjustSigns xs
  | otherwise = x : adjustSigns xs


simplify' :: String -> [(Char, Int)] 
simplify' "" = [] 
simplify' [x] = [(x, 1)] 
simplify' (x:y:xs) 
    | x == '+' || x == '-' = if x == '-' then (y, -1) : simplify' xs else (y, 1) : simplify' xs 
    | otherwise = (x, 1) : simplify' (y:xs) 
  
calculateExpression :: [(Char, Int)] -> [(Char, Int)] 
calculateExpression [] = [] 
calculateExpression ((x, y):xs) 
    | isDigit x = (x, calculateEqualTerms x ((x, y):xs)) : calculateExpression (filter (not . isDigit . fst) xs) 
    | otherwise = (x, y) : calculateExpression xs 
  where 
     calculateEqualTerms _ [] = 0 
     calculateEqualTerms x' ((x'', c'):xs') 
        | isDigit x'' = c' + calculateEqualTerms x' xs' 
        | otherwise = calculateEqualTerms x' xs'
