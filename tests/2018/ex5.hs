length_zip :: [a] -> [(Int,a)]
length_zip l = zip [k,k-1..0] l
    where k = length l
