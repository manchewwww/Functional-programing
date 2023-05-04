import Data.List
main :: IO()
main = do
    print $ coldestCapital [(Country "yulgaria" "Sofia" [(City "Varna" 0 16), (City "Plovdiv" 120 14), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 15), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])] == "Germany"

type Name = String
type Capital = Name
type AvgYearlyTemperature = Double
type Elevation = Int

data City = City Name Elevation AvgYearlyTemperature
data Country = Country Name Capital [City]

getColdestTemp :: Country -> AvgYearlyTemperature
getColdestTemp (Country _ capital cities) = minimum [temp | (City name _ temp) <- cities, name == capital]


vectorWithCountry :: [Country] -> [(Name, AvgYearlyTemperature)]
vectorWithCountry = map (\ country@(Country name _ _) -> (name, getColdestTemp country)) 

coldestCapital :: [Country] -> Name
coldestCapital = fst . foldl1 (\x y -> if snd x < snd y then x else y) . vectorWithCountry