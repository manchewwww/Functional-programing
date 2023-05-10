main :: IO()
main = do
    print $ ordered t1 == True
    print $ ordered t2 == False

data Tree a = Nil | Node a (Tree a) (Tree a)

ordered :: (Ord a) => Tree (a, a) -> Bool
ordered Nil = True
ordered (Node (x, y) left right) = all (\(a, b) -> a >= x && y >= b) (toList left) && all (\(a, b) -> a <= x && y <= b) (toList right) && ordered left && ordered right

toList :: Tree a -> [a]
toList Nil = []
toList (Node x left right) = toList left ++ [x] ++ toList right

t1 = Node (3,10) (Node (5,8) (Node (6,7) Nil Nil) (Node (4,9) Nil Nil)) (Node (2,12) Nil (Node (1,15) Nil Nil))
t2 = Node (3,10) (Node (5,8) (Node (6,7) Nil Nil) (Node (7,9) Nil Nil)) (Node (2,12) Nil (Node (1,15) Nil Nil))