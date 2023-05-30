import Data.List

main :: IO()
main = do
    print $ genWords t1 == ["abe","acd","acf","be","cd","cf","d","e","f"]
    print $ genWords t2 == ["ab","acd","b","cd","d"]
    print $ genWords t3 == ["abdh","abdi","abe","acf","acg","bdh","bdi","be","cf","cg","dh","di","e","f","g","h","i"]

genWords :: BTree Char -> [String]
genWords t = sort
    $ filter (\ candidateWord -> containsWord t candidateWord)
    $ subsequences
    $ traverseBFS' t

traverseBFS' tree = concat $ takeWhile (\ xs -> not $ null xs) $ map (\ k -> getLevel tree k) [0 .. ]

getLevel :: BTree a -> Int -> [a]
getLevel Nil _ = []
getLevel (Node value _ _) 0 = [value]
getLevel (Node value left right) k = getLevel left (k - 1) ++ getLevel right (k - 1)


containsWord :: BTree Char -> String -> Bool
containsWord Nil [] = True
containsWord (Node value Nil Nil) [x] = x == value
containsWord (Node value left right) word@(x:xs)
 | x == value = helper left xs || helper right xs
 | otherwise = containsWord left word || containsWord right word
 where
    helper (Node value Nil Nil) [x] = x == value
    helper (Node value left right) (x:xs) = x == value && (helper left xs || helper right xs)
    helper _ _ = False
containsWord _ _ = False


-- t1:    a
--       / \
--      c   b
--     / \   \
--    f   d   e

data BTree a = Nil | Node a (BTree a) (BTree a)

t1 :: BTree Char
t1 = Node 'a' (Node 'c' (Node 'f' Nil Nil) (Node 'd' Nil Nil)) (Node 'b' Nil (Node 'e' Nil Nil))

t2 :: BTree Char
t2 = Node 'a' (Node 'c' (Node 'd' Nil Nil) Nil) (Node 'b' Nil Nil)

t3 :: BTree Char
t3 = Node 'a' (Node 'b' (Node 'd' (Node 'h' Nil Nil) (Node 'i' Nil Nil)) (Node 'e' Nil Nil)) (Node 'c' (Node 'f' Nil Nil) (Node 'g' Nil Nil))