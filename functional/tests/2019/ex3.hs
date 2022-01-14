diferentesRec :: (Eq a) => [a] -> [a]

diferentesRec [] = []
diferentesRec [x] = []
diferentesRec (x0:x1:xs)
    | x0 == x1 = diferentesRec (x1 : xs)
    | otherwise = x0 : diferentesRec (x1 : xs)

diferentes :: (Eq a) => [a] -> [a]
diferentes (x:xs) = map fst (filter (uncurry (/=)) (zip (x:xs) xs))
