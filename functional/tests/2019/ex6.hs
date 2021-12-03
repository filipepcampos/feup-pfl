parts :: [a] -> [[[a]]]
parts [] = []
parts (x:xs) = map ([x]:) (parts xs) ++ [(x:y):ys | (y:ys) <- (parts xs)]


p :: [a] -> [[[a]]]
p [] = [[]]
p xs = [take x xs : y | x <- [1..length xs], y <- p (drop x xs)] 

r :: [a] -> [[[a]]]
r xs = [ (take n xs):ps | n <- [1.. length xs], ps <- r (drop n xs)]
