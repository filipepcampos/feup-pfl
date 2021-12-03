-- a)
and' :: [Bool] -> Bool
and' = and

-- b)
or' :: [Bool] -> Bool
or' = or

-- c)
concat' :: [[a]] -> [a]
concat' = concat

-- d)
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n k = if n > 0 then k : replicate' (n-1) k else error "Invalid argument"

-- e)
-- (!!)
myindex :: [a] -> Int -> a
myindex (x:xs) 0 = x
myindex [] n = error "Invalid index"
myindex (x:xs) n = myindex xs (n-1)

-- f)
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' e (x:xs) = e == x || elem' e xs
