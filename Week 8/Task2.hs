{-
Define a function that checks whether a given path is valid in a
graph g = (1, [2, 3]), (2, [3, 4]), (3, []), (4, []).
-}

main :: IO()
main = do
    -- print $ getChildren [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 2, 4] == True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 3, 4] == False
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [2, 3] == True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [3, 1] == False

type Node = Int
type Graph = [(Node, [Node])]
type Path = [Node]

getChildren :: Graph -> Node -> [Node]
getChildren g n = head [children | (parent, children) <- g, parent == n]

isPath :: Graph -> Path -> Bool
isPath g path = all (\ (parent, child) -> elem child (getChildren g parent))
                    $ zip path (tail path)