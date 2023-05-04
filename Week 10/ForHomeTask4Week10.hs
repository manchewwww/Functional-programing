main :: IO()
main = do
    print $ findUncles t 5 == [3,4]
    print $ findUncles t 7 == [2,4]
    print $ findUncles t 10 == [5]

getChildren :: Tree -> Int-> Int
getChildren g x = fst $ head [(parent, children) | (parent, children) <- g, elem x children]

getBrothers :: Tree -> Int -> [Int]
getBrothers g x = concat [children | (parent, children) <- g, elem x children]

findUncles :: Tree -> Int -> [Int]
findUncles tree x = [ y | y <- getBrothers tree p, y /= p]
 where
    p = getChildren tree x

type Tree = [(Int, [Int])]
type Graph = (Int, [Int])
t :: Tree
t = [(1,[2,3,4]),(2,[5,6]),(3,[7]),(4,[8,9]),(5,[]),(6,[10]),(7,[]),(8,[]),(9,[]),(10,[])]