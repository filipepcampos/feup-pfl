-- A)
imparDiv3 l = all (\x -> x `mod` 3 /= 0 || not (even x)) l

-- B)
imparDiv3B =  foldr (\x y -> (x `mod` 3 /= 0 || not (even x)) && y) True 
