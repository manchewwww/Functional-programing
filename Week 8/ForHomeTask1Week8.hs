import Data.List
main :: IO()
main = do
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 0 1 == [[1]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 1 == [[1, 2], [1, 3]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 2 1 == [[1, 2, 3], [1, 2, 4]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 2 == [[2,3],[2,4]]
    
type Node = Int
type Graph = [(Node, [Node])]
type Path = [Node]

getChildren :: Graph -> Node -> [Node]
getChildren g n = head [children | (parent, children) <- g, parent == n]

isPath :: Graph -> Path -> Bool
isPath g path = all (\ (parent, child) -> elem child (getChildren g parent))
                    $ zip path (tail path)

simplePaths :: Graph -> Node -> Node -> [Path]
simplePaths graph k n = [xs | xs <- subsequences nodes, length xs == k + 1 && isPath graph xs, head xs == n]
 where
     nodes = map fst graph
