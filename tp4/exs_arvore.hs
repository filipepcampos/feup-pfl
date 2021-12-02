data Arv a = Vazia | No a (Arv a) (Arv a)

debug_c = No 5 Vazia Vazia
debug_b = No 4 Vazia debug_c
debug_d = No 1 Vazia Vazia
debug_arv = No 3 debug_d debug_b


-- Ex 4.7
sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No n a b) = n + sumArv a + sumArv b

-- Ex 4.8
listar :: Arv a -> [a]
listar Vazia = []
listar (No n a b) = listar b ++ (n:listar a)

-- Ex 4.9
nivel :: Int -> Arv a -> [a]
nivel k Vazia = []
nivel k (No n a b) = nivelAux k 0 (No n a b)

nivelAux :: Int -> Int -> Arv a -> [a]
nivelAux k c Vazia = []
nivelAux k c (No n a b)
    | k == c = [n]
    | otherwise = nivelAux k (c+1) a ++ nivelAux k (c+1) b

-- Ex 4.10
mapArv :: (a -> b) -> Arv a -> Arv b
mapArv f Vazia = Vazia
mapArv f (No n a b) = No (f n) (mapArv f a) (mapArv f b)

-- 4.12