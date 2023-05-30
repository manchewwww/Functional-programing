-- Дефиниран е полиморфен алгебричен тип BTree a, описващ двоично дърво:
-- data BTree a = NullT | Node a (BTree a) (BTree a).
-- Да се дефинира функция maxSumSubT :: (Ord a, Num a) => BTree a -> a, която
-- по подадено двоично дърво намира максималната сума на поддърво на това дърво.
-- Сума на дърво е сумата от всички стойности на възли в дървото. Сумата на празното
-- дърво е 0. Счита се, че всяко дърво е свое поддърво.

main :: IO()
main = do
    print $ maxSumSubT t1 == 5
    print $ maxSumSubT t2 == 2

data BTree a = Nil | Node a (BTree a) (BTree a)

t1 :: (Num a) => BTree a
t1 = Node 3 (Node 0 Nil Nil) (Node 2 (Node 0 Nil Nil) Nil)

t2 :: (Num a) => BTree a
t2 = Node (-3) (Node 0 Nil Nil) (Node 2 (Node 0 Nil Nil) Nil)

maxSumSubT :: (Num a, Ord a) => BTree a -> a
maxSumSubT Nil = 0
maxSumSubT t@(Node _ left right) = maximum [sumTree t, sumTree left, sumTree right]

sumTree :: (Num a) => BTree a -> a
sumTree Nil = 0
sumTree (Node value left right) = value + sumTree left + sumTree right