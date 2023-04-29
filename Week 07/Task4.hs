-- Да се дефинира функция scoreHand :: [String] -> Int,
-- която оценява ръка от
-- играта Блекджек (или 21).
-- Функцията приема списък от символни низове, съответни на
-- отделните карти от ръката
-- ("2", "3", ... , "10", "J", "Q", "K", "A"), и
-- намира общия брой точки (оценката) на ръката.
-- Правилата на точкуване са следните:
-- - номерираните карти се оценяват с тяхната
-- стойност (т.е. число от 2 до 10);
-- - вале, дама и поп ("J", "Q", "K") се оценяват с 10;
-- - асото може да се оцени с 1 или 11.
-- Функцията трябва да връща оценката на дадена ръка, която е равна
-- на възможно най-голямата сума k от точките на ръката,
-- която е по-малка или равна на 21. Ако такова k
-- не съществува, да се върне
-- възможно най-малката сума от точките на ръката, която
-- е по-голяма от 21.

import Data.List

main :: IO()
main = do
    print $ scoreHand ["A"] == 11
    print $ scoreHand ["A","J"] == 21
    print $ scoreHand ["5","3","7"] == 15
    print $ scoreHand ["5","4","3","2","A","K"] == 25
    print $ scoreHand ["2","3"] == 5
    print $ scoreHand ["4","5","6"] == 15
    print $ scoreHand ["7","7","8"] == 22
    print $ scoreHand ["K","J","Q"] == 30
    print $ scoreHand ["A","3"] == 14
    print $ scoreHand ["A","A"] == 12
    print $ scoreHand ["A", "10", "A"] == 12
    print $ scoreHand ["A","2","A","9","9"] == 22
    -- ["A","2","A","9","9"] => (["2", "9", "9"], ["A", "A"])

scoreCard :: [String] -> Int
scoreCard = sum . map helper
 where
    helper :: String -> Int
    helper card
     | elem card ["J", "Q", "K"] = 10
     | otherwise = read card

scoreAces :: Int -> [String] -> Int
scoreAces currentSum aces
 | null aces = currentSum
 | currentSum + 11 * length aces > 21 = scoreAces (currentSum + 1) (tail aces)
 | otherwise = currentSum + 11 * length aces

-- scoreAces :: Int -> [String] -> Int
-- scoreAces currentSum [] = currentSum
-- scoreAces currentSum aces
--  | length aces > 1 = currentSum + 11 + (length aces - 1)
--  | currentSum + 11 > 21 = currentSum + 1
--  | otherwise = currentSum + 11

-- scoreHand :: [String] -> Int
scoreHand cards = scoreAces (scoreCard $ snd cardPartitioned) (fst cardPartitioned) 
 where
    cardPartitioned = partition (== "A") cards