mindiv :: Int -> Int
mindiv x = head [k | k <- [2..(floor (sqrt (fromIntegral x)))], x `div` k == 0]
