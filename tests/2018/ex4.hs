merge :: Ord a => [a] -> [a] -> [a]
merge [] l = l
merge l [] = l
merge (x:xs) (y:ys)
    | x < y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys
