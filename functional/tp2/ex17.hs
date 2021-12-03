toBits :: Int -> [Int]
toBits 0 = [0]
toBits n = reverse (toBitsHelper n)
toBitsHelper :: Int -> [Int]
toBitsHelper 0 = []
toBitsHelper n = (n `mod` 2) : toBitsHelper (n `div` 2)
