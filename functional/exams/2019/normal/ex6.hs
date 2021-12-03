data Arv a = Folha | No a (Arv a) (Arv a) deriving (Show)

soma :: Num a => Arv a -> a
soma Folha = 0
soma (No x l r) = x + soma l + soma r

somaArv :: Num a => Arv a -> Arv a -> Arv a
somaArv Folha Folha = Folha
somaArv Folha b = b
somaArv a Folha = a
somaArv (No x1 l1 r1) (No x2 l2 r2)  = No (x1+x2) (somaArv l1 l2) (somaArv r1 r2)
