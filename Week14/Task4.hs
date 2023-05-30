-- Дефиниран е полиморфен алгебричен тип NTree a, описващ дърво с произволен брой
-- наследници: data NTree a = NullT | Node a [(NTree a)].
-- Скучно дърво е дърво, чиито възли съдържат само една стойност. Да се дефинира
-- функция isBoring :: (Eq a) => NTree a -> Bool, която за дадено дърво с
-- произволен брой наследници определя дали то е скучно дърво. Празното дърво се
-- приема за скучно дърво.
import Data.List
main :: IO()
main = do
    print $ isBoring t1 == False
    print $ isBoring t2 == True

data NTree a = Nil | Node a [NTree a]

t1 :: (Num a) => NTree a
t1 = Node 10 [Node 10 [Node 10 [Nil], Node 8 [Node 10 [Nil]], Node 2 [Nil]], Node 10 [Node 11 [Nil], Node 10 [Nil], Node 6 [Nil]]]

t2 :: NTree Char
t2 = Node 's' [Node 's' [Node 's' [Nil], Node 's' [Node 's' [Nil]]]]

isBoring :: (Eq a) => NTree a -> Bool
isBoring = (== 1) . length . nub . traverseDFS
-- isBoring t = group $ traverseDFS t
-- isBoring Nil = True
-- isBoring t@(Node root _) = all (== root) $ traverseDFS t
-- isBoring t = 1 == length (nub $ traverseDFS t)

traverseDFS :: NTree a -> [a]
traverseDFS Nil = []
traverseDFS (Node value children) = value : concatMap traverseDFS children