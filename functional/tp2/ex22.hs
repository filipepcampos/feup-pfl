-- a)
merge :: Ord a => [a] -> [a] -> [a]
merge [] l = l
merge l [] = l
merge (x:xs) (y:ys)
    | x < y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

-- b)
metades :: [a] -> ([a],[a])
metades l = splitAt h l -- (take h l, drop h l)
    where h = length l `div` 2

msort :: Ord a => [a] -> [a]
msort [] = []
msort [a] = [a]
msort l = merge (msort (fst halves))  (msort(snd halves))
    where halves = metades l
