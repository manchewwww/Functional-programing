import Data.Char

main :: IO()
main = do
    print $ reduceStr "dabAcCaCBAcCcaDD" == "dabCBAcaDD"

-- They represent the same character
-- AND they are next to each other
-- AND the first is
-- upper-case and the second - lower-case (or vice versa).

areDuplicates :: Char -> Char -> Bool
areDuplicates x y = toLower x == toLower y && x /= y

reduceStr :: String -> String
reduceStr [] = []
reduceStr (s:ss) = reverse $ helper [s] ss
 where
    helper :: String -> String -> String
    helper result [] = result
    helper (top:ss) (l:ls)
     | areDuplicates top l = helper ss ls
     | otherwise = helper (l:top:ss) ls