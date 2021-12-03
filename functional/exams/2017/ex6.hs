-- scanl (*) 1 [2,2..] = [1,2,4,8,16...]
-- Não utilizar map, fold, scanl


scanl' f s (x:xs) =  s : scanl' f res xs
    where res = f s x 
