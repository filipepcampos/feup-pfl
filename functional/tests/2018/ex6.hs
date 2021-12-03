decompor :: Int -> [Int] -> [[Int]]
decompor 0 _ = [[]]
decompor n xs =  foldr (++) [] [map (i:) (decompor (n-i) [j | j <- xs, j >= i]) | i <- xs, i <= n]
