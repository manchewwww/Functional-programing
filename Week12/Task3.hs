main :: IO()
main = do
    print $ grandchildrenIncreased t1 == False
    print $ grandchildrenIncreased t2 == True

