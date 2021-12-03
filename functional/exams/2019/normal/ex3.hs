type Vert = Int
type Graph = [(Vert, Vert)]

transitiva [] = True
transitiva ((a,b):xs) = False
