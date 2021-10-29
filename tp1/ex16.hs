import Data.Map (Map)
import qualified Data.Map as Map

-- TODO:
-- Zero
-- Números entre 10 e 20

list1 = ["um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove"]
list10 = ["dez", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"]
list100 = ["cem", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos"]


converteParcial :: [String] -> Int -> String
converteParcial l x
    | x > 0 && x < 10 = l !! (x-1)
    | otherwise = ""

c1000 x = if k /= 1 then converte k  ++ " mil " else "mil "
    where k = x `div` 1000
c100 x = converteParcial list100 (x `div` 100)
c10 x = converteParcial list10 (x `div` 10)
c1 = converteParcial list1

continuar :: Integral a => a -> a -> Bool
continuar a b
    | a `mod` b == 0 = False
    | otherwise = True

foo a b = if continuar a b then " e " ++ converte (a `mod` b) else ""

converte :: Int -> String
converte x
    | x <= 1000000 && x >= 1000 = c1000 x  ++ converte (x `mod` 1000)
    | x >= 100                  = c100 x ++ foo x 100
    | x >= 10                   = c10 x  ++ foo x 10
    | x > 0                     = c1 x
    | otherwise = ""