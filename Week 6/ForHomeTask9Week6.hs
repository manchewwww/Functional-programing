import Data.Char
main :: IO()
main = do
    print $ reduceStr "dabAcCaCBAcCcaDD" == "dabCBAcaDD" -- dabAcCaCBAcCcaDD -> dabAaCBAcCcaDD -> dabCBAcCcaDD -> dabCBAcaDD

areDublicate x y = toLower x == toLower y  && (isLower x && isUpper y || isUpper x && isLower y)

reduceStr :: String -> String
reduceStr [] = []
reduceStr (x:xs) = reverse $ helper [x] xs
 where
    helper ss [] = ss
    helper (s:ss) (l:ll)
     | areDublicate s l = helper ss ll
     | otherwise = helper (l:s:ss) ll 