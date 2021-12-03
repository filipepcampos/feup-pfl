zip3' l1 l2 l3 = [(a,b,c) | ((a,b),c) <- zip (zip l1 l2) l3]
