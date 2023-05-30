-- Посещаемостта на ученик по предмет може да се представи чрез списък с елементи от
-- алгебричен тип, който определя дали студент е пропуснал часа (Absent), закъснял е за
-- часа (Late) или е присъствал в часа (Present). За да може да получи срочна оценка,
-- ученикът не може да пропусне повече от n часа и не може да закъснее повече от k пъти
-- подред. Да се дефинира функция от по-висок ред canPass :: Criterion ->
-- (StudentRecord -> Bool), която приема двуелементен вектор, представящ
-- максималния разрешен брой пропуснати часове и поредни закъснения, които може да
-- има даден ученик, и връща функция, която за дадена посещаемост на ученик връща
-- булева стойност, определяща дали този ученик може да получи срочна оценка.
import Data.List
main :: IO()
main = do
    print $ cP [Present, Late, Present, Absent, Present, Present, Present, Absent] == False
    print $ cP [Present, Late, Present, Late, Present, Late, Present, Absent, Late, Present] == True
    print $ cP [Present, Late, Present, Late, Late, Late, Present, Present, Absent, Present] == False

-- [Present, Late, Present, Late, Late, Late, Present, Present, Absent, Present]
-- [[Present], [Late], [Present], [Late, Late, Late], [Present, Present], [Absent], [Present]]
-- [[Late], [Late, Late, Late]]

cP = canPass (1, 2)

type Misses = Int
type Lates = Int
type Criterion = (Misses, Lates)

data Attendance = Absent | Late | Present deriving (Eq)
type StudentRecord = [Attendance]

canPass :: Criterion -> (StudentRecord -> Bool)
canPass (miss, lates) = (\ records -> lessThanMiss records && lessThanLates records)
 where
    lessThanMiss = (<= miss) . length . filter (== Absent)
    lessThanLates = null . filter (\ ys -> elem Late ys && length ys > lates) . group
    -- lessThanLates xs = null [ys | ys <- group xs, elem Late ys, length ys > lates ]
    -- lessThanLates xs = [ | ys <- group xs, any (==Late) ys ]

