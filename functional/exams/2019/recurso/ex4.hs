-- a_1 = 1
-- a_n = 2 * a_{n-1] + n + 1

f (a,n) = (2 * a + n + 1, n+1)
serie = map (fst) (iterate f (1,2))
