niguais_rec 0 x = []
niguais_rec n x = x : niguais_rec (n-1) x

niguais n x = [x | _ <- [1..n]]
