import Data.List (sort)
-- a
mediana :: (Num a, Ord a) => a -> a -> a -> a
mediana a b c = sort [a, b, c] !! 1
-- b
mediana' :: (Num a, Ord a) => a -> a -> a -> a
mediana' a b c = sum l - maximum l - minimum l
        where l = [a, b, c]
