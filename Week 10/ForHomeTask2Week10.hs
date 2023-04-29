import Data.List
main :: IO()
main = do
    print $ listLeaves [(1, 2, 3), (2, 4, 5)] -- == [4, 3, 5]
    print $ listLeaves [(2, 4, 5), (1, 2, 3)] == [4, 5, 3]
    print $ listLeaves [(1, 2, 3), (3, 4, 5), (5, 6, 9)] == [2, 4, 6, 9]

type Node = Int
type Vector = (Node, Node, Node)
type VectorList = [Vector]

parentsList :: VectorList -> [Node]
parentsList [] = []
parentsList ((x, _, _):xs) = x : parentsList xs

childrenList :: VectorList -> [Node]
childrenList [] = []
childrenList ((_, y, z):xs) = y : z : childrenList xs

listLeaves :: VectorList -> [Node]
listLeaves xs = helper (parentsList xs) (childrenList xs)
 where
    helper parent children = [y | y <- children, elem y parent == False]