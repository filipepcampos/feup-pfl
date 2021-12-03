curta :: [a] -> Bool
curta l = length l <= 2

curta1 :: [a] -> Bool 
curta1 [] = True
curta1 [_] = True -- This looks so weird...
curta1 [_,_] = True
curta1 l = False

curta2 :: [a] -> Bool 
curta2 [] = True
curta2 (_:[]) = True
curta2 (_:_:[]) = True
curta2 l = False
