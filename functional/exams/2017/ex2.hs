nafrente e l = map (e:) l
ocorreN x n l = (sum [if k == x then 1 else 0 | k <- l]) == n
