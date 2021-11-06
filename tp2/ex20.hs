insert :: Ord a => a -> [a] -> [a]
insert n [] = [n]
insert n l 
    | n > last l = l ++ [n]
    | n > head l = head l : insert n (drop 1 l)
    | otherwise  = n : l
isort :: Ord a => [a] -> [a]
isort [] = []
isort l = insert (head l) (isort (tail l))
