last0 :: [a] -> a
last0 l = (drop (length l - 1) l) !! 0

last1 :: [a] -> a
last1 l = head (drop (length l - 1) l)

last2 :: [a] -> a
last2 l = head (reverse l)

last3 :: [a] -> a
last3 l = l !! (length l - 1)
