-- Да се дефинира на функционално ниво функция filterTypical :: [String] ->
-- [String], която приема списък от низове като аргумент и връща филтриран списък,
-- който не съдържа „типични думи“. Типична дума е всеки символен низ в предварително
-- попълнен списък typical. Елементите на върнатия списък трябва да са в същия ред
-- като в дадения списък.

main :: IO()
main = do
    print $ filterTypical ["Mallard", "Hook Bill", "African", "Crested", "Pilgrim", "Toulouse", "Blue Swedish"] == ["Mallard", "Hook Bill", "Crested", "Blue Swedish"]
    print $ filterTypical ["Mallard", "Barbary", "Hook Bill", "Blue Swedish", "Crested"] == ["Mallard", "Barbary", "Hook Bill", "Blue Swedish", "Crested"]
    print $ filterTypical ["African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher"] == []

typical = ["African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher"]

filterTypical :: [String] -> [String]
filterTypical = filter (\ word -> notElem word typical) 

