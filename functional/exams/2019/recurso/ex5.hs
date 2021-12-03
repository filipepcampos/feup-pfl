-- A)
duplicada (x0:x1:xs)
    | x0 == x1 = duplicada xs
    | otherwise = False
duplicada [] = True
duplicada l = False

-- B)
duplica l = foldr (++) [] [[x,x] | x <- l]
