fromBits :: [Int] -> Int
fromBits l = sum [k*(2^d) | (k,d) <- zip l [len-1,len-2..0]]
    where len = length l
