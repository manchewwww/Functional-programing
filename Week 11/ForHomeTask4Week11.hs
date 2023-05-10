main :: IO()
main = do
    print $ isGraceful t1 == True
    print $ isGraceful t2 == False

data NTree a = Nil | Node a [NTree a]

isGraceful :: (Integral a) => NTree a -> Bool
isGraceful Nil = True
isGraceful (Node _ [Nil]) = True
isGraceful (Node p cs) = all even (map abs $ zipWith (-) (repeat p) (map rootLabel cs)) && all isGraceful cs
 where
    rootLabel (Node l _) = l

t1 :: NTree Int
t1 = Node 1 [Node 3 [Nil], Node 5 [Nil], Node 7 [Nil], Node 9 [Nil]]

t2 :: NTree Int
t2 = Node 7 [Node 9 [Node 5 [], Node 2 []]]







