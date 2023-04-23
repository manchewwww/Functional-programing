{-
Given a directed graph g with edges
[(1, 2), (1, 3), (2, 3), (2, 4)] define the
following functions:
1. nodes - returns all the nodes of "g";
2. neighbors - accepts a node and returns its neighbors;
3. adjacencyList - returns the children of every parent.
Implementation detail: Create types for the graph
structure.
-}

import Data.List

main :: IO()
main = do
    print $ nodes [(1, 2), (1, 3), (2, 3), (2, 4)] == [1, 2, 3, 4]

    print $ neighbors 2 [(1, 2), (1, 3), (2, 3), (2, 4)] == [3, 4]
    print $ neighbors 4 [(1, 2), (1, 3), (2, 3), (2, 4)] == []

    print $ adjacencyList [(1, 2), (1, 3), (2, 3), (2, 4)] == [(1, [2, 3]), (2, [3, 4])]

type Graph = [Edge]
type Edge = (Int, Int)
type Node = Int

adjacencyList :: Graph -> [(Node, [Node])]
adjacencyList g = [ (n, neighbors n g) | n <- nodes g, neighbors n g /= []]

neighbors :: Node -> Graph -> [Node]
neighbors n g = [ y | (x, y) <- g, x == n]

nodes :: Graph -> [Node]
nodes = nub . concatMap (\ (x, y) -> [x, y])
-- nodes g = nub $ concat [ [x, y] | (x, y) <- g]