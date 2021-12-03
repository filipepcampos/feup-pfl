import Data.Char(ord, chr)

primos :: [Int]
primos = crivo [2..]

crivo :: [Int] -> [Int]
crivo (p:xs) = p : crivo [x | x<-xs, x `mod` p /= 0]

factores :: Int -> [Int]
factores n = factoresAux n primos
factoresAux 0 _ = []
factoresAux _ [] = [] -- This shouldn't happen
factoresAux n (p:ps)
    | n `mod` p == 0 = factoresAux (n `div` p) (p:ps)
    | otherwise = factoresAux n ps


-- 4.2
calcPi1 :: Int -> Double
calcPi1 n = sum (take n (zipWith (/) (cycle [4,-4]) [1,3..]))

calcPi2 :: Int -> Double
calcPi2 n = 3 + sum (take n (zipWith (/) (cycle [4,-4]) [x*(x+1)*(x+2) | x <- [2,4..]]))

-- 4.3
--intercalar :: a -> [a] -> [[a]]
--intercalar x ys = intercalarAux [] x ys

--intercalarAux :: [a] -> a -> [a] -> [[a]]
--intercalarAux [] x [] = [[x]]
--intercalarAux zs x [] = [zs ++ [x]]
--intercalarAux zs x (y:ys)  = (zs ++ (x : (y:ys))) : intercalarAux (zs ++ [y]) x ys

intercalar :: a -> [a] -> [[a]]
intercalar x [] = [[x]]
intercalar x (y:ys) = (x:y:ys) : map (y:) (intercalar x ys)

-- 4.4
-- perms [1,2,3] = [[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]
-- perms [1,2,3] = ------------------------ --------------  -------------
--                   intercalar 1 [2,3]   intercalar 3 [1,2]  
perms :: [a] -> [[a]]
perms [] = []
perms (x:xs) = intercalar x xs ++ perms xs

-- TODO


-- 4.5
--cifraChave :: String -> String -> String
--cifraChave' str key = zipWith (\x y -> chr (ord 'A' + ((ord x) - (ord y) `mod` 25))) (cycle(key)) str
cifraChave str key = zipWith (\x y -> chr (ord 'A' + (((ord x) + ((ord y) - (ord 'A'))) `mod` 25))) (cycle(key)) str

-- A -> (+11) -> L
-- T -> (+20) -> N