main :: IO()
main = do
    print $ constructMaxBTree [3, 2, 1, 6, 0, 5] -- == t

data BTree a = Nil | Node a (BTree a) (BTree a)
 deriving (Show, Eq)

constructMaxBTree :: (Eq a, Ord a) => [a] -> BTree a
constructMaxBTree [] = Nil
constructMaxBTree xs = Node maxEl (constructMaxBTree leftSubtree')
                        (constructMaxBTree rightSubtree)
 where
    maxEl = maximum xs
    leftSubtree' = takeWhile (/= maxEl) xs
    -- leftSubtree = takeWhile (\ x -> x /= maxEl) xs
    rightSubtree = tail $ dropWhile (/= maxEl) xs


t :: BTree Int
t = Node 6 (Node 3 Nil (Node 2 Nil (Node 1 Nil Nil))) (Node 5 (Node 0 Nil Nil) Nil)