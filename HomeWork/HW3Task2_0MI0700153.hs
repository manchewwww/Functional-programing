import Data.Char (isDigit, isAlpha)
import Data.List (sort)

main :: IO()
main = do
    putStrLn $ simplify "1+2+x"  -- "x+3"
    putStrLn $ simplify "x+2+x-2"  -- "2x"
    putStrLn $ simplify "x+2-(x-2)"  -- "4"
    putStrLn $ simplify "y+2+x-2"  -- "x+y"
    putStrLn $ simplify "1+2+x+y+x+z+5-x-x-x+y"  -- "-x+2y+z+8"
    putStrLn $ simplify "1+2-(3-(3-2))-9"  -- "-8"

simplify :: String -> String
simplify = formatOutput . processExpression []

processExpression :: [(Char, Int)] -> String -> [(Char, Int)]
processExpression stack [] = stack
processExpression stack (x:xs)  
    | isDigit x = processExpression (handleDigit stack (read [x]) (getNum xs)) (skipNum xs)
    | x == '+' || x == '-' || x == ')' =
        let (coeff, rest) = splitAtCoefficient xs
            num = if null coeff then 1 else read coeff
            stack' = handleCoefficient stack x num
        in processExpression stack' rest
    | isAlpha x = processExpression stack (handleVariable stack (x : getVariable xs))
    where
        getNum = takeWhile isDigit
        getVariable = takeWhile isAlpha
        skipNum = dropWhile isDigit

        handleDigit [] num = [(' ', num)]
        handleDigit ((var, coeff) : rest) num = (var, coeff + num) : rest

        splitAtCoefficient :: String -> (String, String)
        splitAtCoefficient = span isDigit

        handleCoefficient [] '+' num = [('+', num)]
        handleCoefficient [] '-' num = [('-', num)]
        handleCoefficient stack@(('+', _) : _) '+' num = ('+', num) : stack
        handleCoefficient stack@(('-', _) : _) '-' num = ('-', num) : stack
        handleCoefficient stack '+' num = ('+', num) : stack
        handleCoefficient stack '-' num = ('-', num) : stack

        handleVariable [] [x] = [(x, 1)]
        handleVariable ((' ', coeff) : rest) [x] = (x, coeff) : rest
        handleVariable stack [x] = (x, 1) : stack

formatOutput :: [(Char, Int)] -> String
formatOutput stack = let sortedStack = sort stack in concatMap formatTerm sortedStack

formatTerm :: (Char, Int) -> String
formatTerm (' ', num) = show num
formatTerm (var, 1) = [var]
formatTerm (var, coeff) = show coeff ++ [var]
