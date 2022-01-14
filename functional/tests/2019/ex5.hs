partir n [] = ([], [])
partir n (x:xs)
    | n == x = ([], (x:xs))
    | otherwise = (x:l,r)
    where (l,r) = partir n xs
