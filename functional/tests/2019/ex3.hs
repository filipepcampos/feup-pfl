diferentesRec (x0:x1:xs)
    | x0 == x1 = diferentesRec (x1 : xs)
    | otherwise = x0 ++ diferentesRec (x1 : xs)
