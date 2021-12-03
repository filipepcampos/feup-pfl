max3 :: Ord a => a -> a -> a -> a
max3 a b c = max (max a b) c

min3 :: Ord a => a -> a -> a -> a
min3 a b c = min (min a b) c

min3' :: Ord a => a -> a -> a -> a
min3' a b c = minimum [a, b, c]