classifica :: Float -> Float -> String 
classifica w h 
    | imc < 18.5 = "baixo peso"
    | imc < 25   = "peso normal"
    | imc < 30   = "excesso de peso"
    | otherwise  = "obesidade"
    where imc = w / (h^2)
