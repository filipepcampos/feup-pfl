-- Ex 1.12
xor :: Bool -> Bool -> Bool
xor True True = False
xor True False = True
xor False True = True
xor False False = False

xor' :: Bool -> Bool -> Bool
xor' True True = False
xor' a b = a || b
