main :: IO()
main = do
    print $ minDepthGreenNode colorTree == 2

colorTree :: Tree
colorTree = Node Blue (Node Red (Node Green Empty Empty) Empty) (Node Red (Node Blue (Node Green Empty Empty) (Node Red Empty Empty)) Empty)

minDepthGreenNode :: Tree -> Int
minDepthGreenNode tree = minDepth tree 0
  where
    minDepth :: Tree -> Int -> Int
    minDepth Empty _ = maxBound
    minDepth (Node Green _ _) depth = depth
    minDepth (Node _ left right) depth = min (minDepth left (depth + 1)) (minDepth right (depth + 1))


data Color = Red | Green | Blue
data Tree = Empty | Node Color Tree Tree