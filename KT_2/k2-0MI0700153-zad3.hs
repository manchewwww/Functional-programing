import Data.List
main :: IO ()
main = do
    print $ mapLevel t1 [(*2), (*4), (`div` 100)] == t11Result
    print $ mapLevel t1 [show, nub . show . (* 1000)] == t12Result
    print $ mapLevel t2 [(\ _ -> "r"), (\ char -> "w_" ++ [char]), (\ char -> "l_" ++ [char])] == t2Result

data NTree a = Nil | Node a [NTree a] 
 deriving (Eq, Show)

mapLevel :: (Eq a, Eq b) => NTree a -> [(a -> b)] -> NTree b
mapLevel tree funcs = removeNil (mapLevel' tree funcs 1)

mapLevel' :: NTree a -> [(a -> b)] -> Int -> NTree b
mapLevel' Nil _ _ = Nil
mapLevel' (Node val children) funcs level
    | level > length funcs = Nil  
    | null children = Node (applyFuncs funcs level val) []
    | otherwise = Node (applyFuncs funcs level val) (map (\c -> mapLevel' c funcs (level + 1)) children)

applyFuncs :: [(a -> b)] -> Int -> a -> b
applyFuncs funcs level val
    | level > length funcs = error "No matching function"
    | otherwise = (funcs !! (level - 1)) val

removeNil :: (Eq a) => NTree a -> NTree a
removeNil Nil = Nil
removeNil (Node value children) =
  let filteredChildren = map removeNil children
      nonEmptyChildren = filter (/= Nil) filteredChildren
  in Node value nonEmptyChildren

t1 :: NTree Int
t1 = Node 10 [Node 10 [Node 10 [], Node 8 [Node 10 []], Node 2 []],
              Node 10 [Node 11 [], Node 10 [], Node 6 []]]

t2 :: NTree Char
t2 = Node 's' [Node 's' [Node 's' [], Node 's' []]]

t11Result :: NTree Int
t11Result = Node 20 [Node 40 [Node 0 [], Node 0 [], Node 0 []],
                     Node 40 [Node 0 [], Node 0 [], Node 0 []]]

t12Result :: NTree String
t12Result = Node "10" [Node "10" [], Node "10" []]

t2Result :: NTree String
t2Result = Node "r" [Node "w_s" [Node "l_s" [], Node "l_s" []]]


