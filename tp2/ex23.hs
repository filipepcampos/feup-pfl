import Data.List

-- a)
addPoly :: [Int] -> [Int] -> [Int]
addPoly p q = [x+y | (x,y) <- zip p q]

-- b)
multPoly :: [Int] -> [Int] -> [Int]
multPoly p q =  reverse (multPolyAcc 0 0 (sort [(i1+i2, x*y) | (x,i1) <- pz, (y, i2) <- qz]))
                where pz = zip p [length p - 1, length p - 2..0]
                      qz = zip q [length q - 1, length q - 2..0]

multPolyAcc :: Int -> Int -> [(Int, Int)] -> [Int]
multPolyAcc acc _ [] = [acc]
multPolyAcc acc i (x:xs)
    | fst x == i = multPolyAcc (acc + snd x) i xs
    | otherwise  = acc : multPolyAcc (snd x) (fst x) xs
