nubRecursiva :: Eq a => [a] -> [a]
nubRecursiva [] = []
nubRecursiva (x:xs) = x : nubRecursiva [k | k <- xs, k /= x]

