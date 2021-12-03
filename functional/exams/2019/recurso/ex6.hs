data Arv a = Folha a | No (Arv a) (Arv a)

-- A)
emOrdem (Folha n) = [n]
emOrdem (No esq dir) = emOrdem esq ++ emOrdem dir

-- B)
anyArv f = any f . emOrdem
