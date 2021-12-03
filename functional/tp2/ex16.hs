algarismos :: Int -> [Int]
algarismos n = reverse (algarismosHelper n)
algarismosHelper :: Int -> [Int]
algarismosHelper 0 = []
algarismosHelper n = (n `mod` 10) : algarismosHelper (n `div` 10)
