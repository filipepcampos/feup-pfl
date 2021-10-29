metades :: [a] -> ([a], [a])
metades l = (take (length l `div` 2) l, drop (length l `div` 2) l)

metades' :: [a] -> ([a], [a])
metades' l = splitAt (length l `div` 2) l
