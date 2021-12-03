data ArvT a = Folha a | No (ArvT a) (ArvT a) (ArvT a)

arv :: ArvT Int
arv = No (Folha 1) (No (Folha 4) (Folha 5) (Folha 8)) (Folha 9)

nelementos :: ArvT a -> Int
nelementos (Folha _) = 1
nelementos (No l m r) = nelementos l + nelementos m + nelementos r


mapTree :: (a -> a) -> ArvT a -> ArvT a
mapTree f (Folha n) = Folha (f n)
mapTree f (No l m r) = No (mapTree f l) (mapTree f m) (mapTree f r)
