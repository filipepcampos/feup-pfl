raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = (((-b) + sqrtResult) / (2*a), ((-b) - sqrtResult) / (2*a))
    where
        sqrtResult = sqrt ((b^2) - (4*a*c))

