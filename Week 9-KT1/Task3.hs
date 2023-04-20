main :: IO()
main = do
    print $ numContentChildren [1, 2, 3] [1, 1] == 1
    print $ numContentChildren [1, 2] [1, 2, 3] == 2

