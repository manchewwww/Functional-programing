main :: IO ()
main = do
    print $ highestCapital [(Country "Bulgaria" "Sofia" [(City "Varna" 0 16), (City "Plovdiv" 120 14), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 15), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])] == "Bulgaria"

type Name = String
type Capital = Name
type AvgYearlyTemperature = Double
type Elevation = Int

data City = City Name Elevation AvgYearlyTemperature
data Country = Country Name Capital [City]

highestCapital :: [Country] -> Name
highestCapital = fst . foldr1 (\ c1@(_, height1) c2@(_, height2) -> if height1 <= height2 then c2 else c1) . map toHeight
  where
    toHeight (Country name capital cities) = (name, head [height | (City name height _) <- cities, name == capital])


-- main :: IO ()
-- main = do
--     print $ highestCapital [(Country "Bulgaria" "Sofia" [(City "Varna" 0 16), (City "Plovdiv" 120 14), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 15), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])]

-- type Name = String
-- type Capital = Name
-- type AvgYearlyTemperature = Double
-- type Elevation = Int

-- data City = City Name Elevation AvgYearlyTemperature
-- data Country = Country Name Capital [City]

-- highestCapital :: [Country] -> Name
-- highestCapital countries = foldl findHighestCapital (name (head countries)) countries
--   where
--     findHighestCapital :: Name -> Country -> Name
--     findHighestCapital acc country@(Country name capital cities) =
--         let highestElevation = foldl findHighestElevation 0 cities
--             findHighestElevation :: Elevation -> City -> Elevation
--             findHighestElevation accElevation city = max accElevation (elevation city)
--         in if highestElevation < elevation (capitalCity cities)
--              then name
--              else acc


-- name :: Country -> Name
-- name (Country n _ _) = n

-- elevation :: City -> Elevation
-- elevation (City _ e _) = e

-- capitalCity :: [City] -> City
-- capitalCity [] = City "" 0 0
-- capitalCity (c:_) = c
