type Set a = [a]

add :: Eq a => a -> Set a -> Set a
add n set
    | elem n set = set
    | otherwise  = n:set

rem :: Eq a => a -> Set a -> Set a
rem n set = [i | i <- set, i /= n]