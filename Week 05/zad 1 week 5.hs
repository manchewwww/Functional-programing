import Data.List

main :: IO()
main = do
    print $ (myLambda (\ x -> x)) 5 == 5
    print $ (myLambda (\ x -> x)) "Hello" == "Hello"
    print $ (myLambda (+1)) 5 == 6

    print $ (negatePred (\x -> mod x 2 == 0)) 0 == False
    print $ (negatePred (\x -> mod x 2 == 0)) 2 == False

    print $ (compose (\x -> x - 5) (\y -> y + 25)) 5 == 25
    print $ (compose group sort) "Hello World" == [" ","H","W","d","e","lll","oo","r"]
    print $ group "Missisipii"
    print $ (compose group show) 122223

    print $ (partiallyApply (\x y -> 10 * x + y) 5) 10 == 60

    print $ (\ x y z -> x y z) (\ x y -> x + y) 5 6

-- (\ x y z -> x y z) (\ x y -> x + y) 5 6
-- x=(\ x y -> x + y)
-- y=5
-- z=6
-- (\ x y -> x + y) 5 6
-- x=5
-- y=6
-- 5 + 6
-- 11

-- 5 > 4 = []
-- 2 4 => 2 : f 3 4
-- 2 4 => 2 : 3 : f 4 4
-- 2 4 => 2 : 3 : 4 : f 5 3
-- 2 4 => 2 : 3 : 4 : []
-- 2 4 => 2 : 3 : [4]
-- 2 4 => 2 : [3, 4]
-- 2 4 => [2, 3, 4]

partiallyApply :: (a -> a -> a) -> a -> (a -> a)
partiallyApply f x = f x
-- partiallyApply f x = (\ y -> f x y)
-- partiallyApply = id

compose :: (b -> c) -> (a -> b) -> (a -> c)
compose f g = f . g
-- compose f g = (\ x -> f $ g x)

negatePred :: (a -> Bool) -> (a -> Bool)
negatePred pred = not . pred
-- negatePred pred = (\ x -> not $ pred x)

-- myLambda (+1)
--  => (+1) => (+1) 5 => 6

-- id === (\ x -> x)

myLambda :: (a -> a) -> (a -> a)
myLambda f = f
-- myLambda f = (\ x -> f x)
-- myLambda = id
-- myLambda = (\ x -> x)

f = map (2+)
-- f = map (\ x -> 2 + x)