-- Да се дефинира функция persistence :: Int -> (Int, [Int]),
-- която приема
-- естествено число n и връща наредена двойка от вида (x,ys).
-- Вторият елемент на резултата трябва да е списък ys,
-- чийто първи елемент е равен на произведението на цифрите на n,
-- а всеки следващ елемент на ys е равен на произведението на цифрите
-- на предходния до получаването на едноцифрено произведение,
-- на което е равен последният елемент на ys.
-- Първият елемент на резултата е равен на дължината x на списъка ys.
-- Намирането на произведението на цифрите на дадено число да се
-- реализира с линейно итеративен процес.
import Data.List
main :: IO()
main = do
    print $ persistence 39  == (3,[27,14,4])      --3*9=27, 2*7=14, 1*4=4
    print $ persistence 999 == (4,[729,126,12,2]) --9*9*9=729, 7*2*9=126,  
    print $ persistence 126 == (2,[12,2])         --1*2*6=12, 1*2=2
    print $ persistence 4   == (1,[4])

-- persistence 39
-- > helper leftover=39
-- > 27 : helper leftover=27
-- > 27 : 14 : helper leftover=14
-- > 27 : 14 : 4 : helper leftover=4
-- > 27 : 14 : 4 : [4]
-- > [27, 14, 4, 4]
-- > nub [27, 14, 4, 4] => [27, 14, 4]

persistence :: Int -> (Int, [Int])
persistence n = let xs = nub $ helper n in (length xs, xs)
 where
     helper :: Int -> [Int]
     helper leftOver
      | leftOver < 10 = [leftOver]
      | otherwise = mult leftOver : helper (mult leftOver)

mult :: Int -> Int
mult num = helper num 1
 where
     helper :: Int -> Int -> Int
     helper num res
      | num < 10 = res * num
      | otherwise = helper (div num 10) (res * mod num 10)