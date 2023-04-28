main :: IO()
main = do
    -- print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 0 1 == [[1]]
    -- print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 1 -- == [[1, 2], [1, 3]]
    -- print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 2 1 -- == [[1, 2, 3], [1, 2, 4]]
    -- print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 2 -- == [[2,3],[2,4]]
    print $ neighbors 1 [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 
    
type Node = Int
type Graph = [(Node, [Node])]
type Path = [Node]

neighbors :: Node -> Graph -> [Node]
neighbors n g =  concat [xs | (x, xs) <- g, x == n]

simplePaths :: Graph -> Int -> Node -> [Path]
simplePaths _ 0 n = [[n]]
simplePaths graph k n
 | not (elem n nodes) = error "Node not found in graph"
 | otherwise = 
     where
      nodes = map fst graph

-- simplePaths :: Path -> Node -> Node -> [[Node]]
-- simplePaths _ 0 n = [[n]]
-- simplePaths graph k n = 
