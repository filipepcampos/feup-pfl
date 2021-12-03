-- a)
minimum' :: Ord a => [a] -> a
minimum' [] = error "empty list"
minimum' [n] = n
minimum' (x:xs) = if min < x then min else x
    where min = minimum' xs

-- b)
delete' :: Eq a => a -> [a] -> [a]
delete' _ [] = []
delete' n (x:xs)
    | n == x = xs
    | otherwise = x : delete' n xs

-- c)
ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort l = min : ssort (delete' min l)
    where min = minimum' l