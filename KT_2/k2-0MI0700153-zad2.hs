import Data.Char
main :: IO()
main = do
    print $ solve ["abode","ABc","xyzD"] == [4,3,1]
    print $ solve ["abide","ABc","xyz"] == [4,3,0]
    print $ solve ["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"] == [6,5,7]
    print $ solve ["encode","abc","xyzD","ABmD"] == [1,3,1,3]

solve :: [String] -> [Int]
solve = map countCorrectPositions

countCorrectPositions :: String -> Int
countCorrectPositions word = length $ filter isCorrectPosition $ zip word [1..]

isCorrectPosition :: (Char, Int) -> Bool
isCorrectPosition (c, position) = toLower c == letterAtPosition
  where
    letterAtPosition = toLower $ intToLetter position

intToLetter :: Int -> Char
intToLetter n = toEnum (n + 96)
