notaF :: [Float] -> [Float] -> Float
notaF notas pesos = foldr (+) 0 (zipWith (*) notas pesos)

rcf notas = foldr (+) [if n < 8 then 1 else 0 | n <- notas]
