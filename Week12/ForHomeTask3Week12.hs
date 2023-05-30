main :: IO()
main = do
  print $ maxDepthBlueNode colorTree == 2

data Color = Red | Green | Blue
 deriving (Eq)
data Tree = Empty | Node Color Tree Tree


colorTree = Node Blue (Node Red (Node Green Empty Empty) Empty) (Node Red (Node Blue (Node Green Empty Empty) (Node Red Empty Empty)) Empty)

maxDepthBlueNode :: Tree -> Int
maxDepthBlueNode tree = go tree 0
  where
    go :: Tree -> Int -> Int
    go Empty depth = depth
    go (Node color left right) depth
      | color == Blue = max (go left (depth + 1)) (go right (depth + 1))
      | otherwise = max (go left depth) (go right depth)


