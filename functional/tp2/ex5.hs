perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- [1..n], x == sum (divprop x)]
