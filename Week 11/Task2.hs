main :: IO()
main = do
    print $ t1

data NTree a = Nil | Node a [NTree a]
 deriving (Show)

t1 :: NTree Int
t1 = Node 1 [Node 3 [Nil], Node 5 [Nil], Node 7 [Nil], Node 9 [Nil]]