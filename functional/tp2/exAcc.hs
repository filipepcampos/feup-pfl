-- Exercicio de "Learning Haskell by Solving Problems"
myreverse :: [a] -> [a] -- Versão O(n^2)
myreverse [] = []
myreverse (x:xs) = myreverse xs ++ [x]

myreverse' :: [a] -> [a] -- Versão O(n) Pog
myreverse' l = myreverse'aux l []
myreverse'aux :: [a] -> [a] -> [a]
myreverse'aux xs acc = foldl (flip (:)) acc xs