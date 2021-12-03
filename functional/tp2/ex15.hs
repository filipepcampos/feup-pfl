intersperse' :: a -> [a] -> [a]
intersperse' _ [] = []
intersperse' _ [k] = [k]
intersperse' s (x:xs) = [x] ++ [s] ++ intersperse' s xs
