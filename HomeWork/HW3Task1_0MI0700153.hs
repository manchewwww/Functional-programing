main :: IO ()
main = do
    print $ prune (T 1 [T 2 [T 3 []], T 4 [T 5 [T 6 []]], T 7 [T 8 [], T 9 [T 10 [T 11 []]]]]) == T 1 [T 2 [T 3 []], T 4 [T 5 []], T 7 [T 8 [], T 9 [T 10 []]]]

data NTree a = T a [NTree a]
    deriving (Eq, Show)

prune :: NTree a -> NTree a
prune t@(T value children)
 | isStick t = T value (map (\ (T y _) -> (T y [])) children)
 | otherwise = T value (map prune children)
  where
    isStick (T _ []) = True
    isStick (T _ [children]) = isStick children
    isStick _ = False
