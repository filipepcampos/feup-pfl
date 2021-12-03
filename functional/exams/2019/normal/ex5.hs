deleteNthRec n l = deleteNthRecAux n l n
deleteNthRecAux n [] _ = []
deleteNthRecAux n (x:xs) current 
    | current == 1 = deleteNthRecAux n xs n
    | otherwise = x : deleteNthRecAux n xs (current-1)

deleteNth n l = [x | (x,i) <- zip l [1..], i `mod` n /= 0]
