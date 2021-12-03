safetail :: [a] -> [a]
safetail l = if null l then [] else tail l

safetail1 :: [a] -> [a]
safetail1 l 
    | null l = []
    | otherwise = tail l

safetail2 :: [a] -> [a]
safetail2 [] = []
safetail2 l = tail l