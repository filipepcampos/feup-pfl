concat'' :: [[a]] -> [a]
concat'' k = [x | xs <- k, x <- xs]

replicate'' :: Int -> a -> [a]
replicate'' n k = [k | _ <- [1..n]]

myindex' :: [a] -> Int -> a
myindex' l n = head [x | (x,i) <- zip l [0..], i==n]
