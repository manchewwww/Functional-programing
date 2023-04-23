main :: IO()
main = do
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 0 1 == [[1]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 1 -- == [[1, 2], [1, 3]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 2 1 -- == [[1, 2, 3], [1, 2, 4]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 2 -- == [[2,3],[2,4]]

type Node = Int
type Graph = [(Node, [Node])]
type Path = [Node]

simplePaths :: Graph -> Int -> Node -> [Path]
simplePaths graph k n
  | not (elem n nodes) = error "Node not found in graph"
  | otherwise = go k [n] 
   where
      nodes = map fst graph
      go 0 path = [path]
      go m path = concat [go (m-1) (v:path) | v <- neighbors path]
      neighbors path = case lookup (head path) graph of
                          Just ns -> filter (`notElem` path) ns
                          Nothing -> []


-- getChildren :: Graph -> Node -> [Node]
-- getChildren g n = head [children | (parent, children) <- g, parent == n]

-- simplePaths :: Path -> Node -> Node -> [[Node]]
-- simplePaths _ 0 n = [[n]]
-- simplePaths graph k n = 
