{-
Define a new data type called Shape. Shape must have four constructors:

Circle: with one argument representing the radius;
Rectangle: with two arguments representing the width and height;
Triangle;
Cylinder with two arguments for the radius of the base and height.
Create a shape from every type and output it.
-}

main :: IO()
main = do
    print $ Circle 5
    print $ Rectangle 5 10
    print $ Triangle 1 2 3
    print $ Triangle 1.42 2.55 6.66
    print $ f $ Circle 5

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show)

f :: (Num a) => Shape a -> a
f (Circle n) = n * 42
