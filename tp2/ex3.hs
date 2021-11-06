dotprod :: [Float] -> [Float] -> Float
dotprod l1 l2 = sum [a*b | (a,b) <- zip l1 l2]
