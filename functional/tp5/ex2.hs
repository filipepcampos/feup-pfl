import Stack

-- Ex 5.2
applyF :: (Float -> Float -> Float) -> Stack Float -> Stack Float
applyF f stack = push (f (top stack) (top (pop stack))) stack

calc :: Stack Float -> String -> Stack Float
calc stack str
    | str == "+" = applyF (+) stack
    | str == "*" = applyF (*) stack
    | str == "-" = applyF (-) stack
    | str == "/" = applyF (/) stack
    | otherwise  = push (read str) stack

calcular :: String -> Float
calcular str = top(foldl calc empty (words str))

main :: IO()
main = do 
    putStr "Expression: "
    l <- getLine
    putStr ("l'" ++ l ++ "' = " ++ show (calcular l) ++ "\n")
    