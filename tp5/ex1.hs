import Stack

-- Ex 5.1
parent :: String -> Bool 
parent str = parentAux str empty

matches :: Char -> Char -> Bool
matches ')' '(' = True
matches ']' '[' = True
matches a b = False

parentAux :: String -> Stack Char -> Bool
parentAux "" stack = isEmpty stack
parentAux (h:str) stack
    | (isEmpty stack) || not (matches h (top stack)) = parentAux str (push h stack)
    | otherwise = parentAux str (pop stack)

