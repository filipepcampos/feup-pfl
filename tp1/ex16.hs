listaUnidades = ["um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove"]
lista10_19 = ["dez", "onze", "doze", "treze", "catorze", "quinze", "dezasseis", "dezassete", "dezoito", "dezanove"]
listaDezenas = ["dez", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"]
listaCentenas = ["cento", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos"]

acederLista :: [String] -> Int -> String
acederLista l x
    | x > 0 && x < length l + 1 = l !! (x-1)
    | otherwise = ""

converteMilhares :: Int -> String
converteMilhares x 
    | k /= 1 = converte k ++ " mil "
    | otherwise = "mil "
    where k = x `div` 1000

converteCentenas x = acederLista listaCentenas (x `div` 100)
converteDezenas x = acederLista listaDezenas (x `div` 10)
converte10_19 x = acederLista lista10_19 (x - 9)
converteUnidades = acederLista listaUnidades

continuar :: Int -> Int -> Bool
continuar a b = a `mod` b /= 0

conectar :: Int -> Int -> String
conectar a b 
    | continuar a b = " e " ++ converte (a `mod` b)
    | otherwise = ""

converte :: Int -> String
converte x
    | x <= 1000000 && x >= 1000 = converteMilhares x ++ converte (x `mod` 1000)
    | x > 100                   = converteCentenas x ++ conectar x 100
    | x == 100                  = "cem" -- I know this looks awful
    | x >= 20                   = converteDezenas x  ++ conectar x 10
    | x >= 10                   = converte10_19 x
    | x > 0                     = converteUnidades x
    | x == 0                    = "zero"
    | otherwise = ""