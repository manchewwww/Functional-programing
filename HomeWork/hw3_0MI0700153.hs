import Data.List
import Data.Char
main :: IO ()
main = do
    print $ prune (T 1 [T 2 [T 3 []], T 4 [T 5 [T 6 []]], T 7 [T 8 [], T 9 [T 10 [T 11 []]]]]) == T 1 [T 2 [T 3 []], T 4 [T 5 []], T 7 [T 8 [], T 9 [T 10 []]]]
    print $ simplify "1+2+x" -- == "x+3"
    print $ simplify "x+2+x-2" -- == "2x"
    print $ simplify "x+2-(x-2)" -- == "4"
    print $ simplify "y+2+x-2" -- == "x+y"
    print $ simplify "1+2+x+y+x+z+5-x-x-x+y" -- == "-x+2y+z+8"
    print $ simplify "1+2+x+y+x-(x-x-x)+z+y-10" -- =="3x+2y+z-7"
    print $ simplify "1+2-(3-(3-2))-10" -- == "-9"

data NTree a = T a [NTree a]
    deriving (Eq, Show)

prune :: NTree a -> NTree a
prune t@(T value children)
 | isStick t = T value (map (\ (T y _) -> (T y [])) children)
 | otherwise = T value (map prune children)
  where
    isStick (T _ []) = True
    isStick (T _ [children]) = isStick children
    isStick _ = False

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
