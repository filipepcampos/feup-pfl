aprox :: Int -> Double -- Solves for x
aprox k = 4 * sum [(-1)^n / (2.0 * fromIntegral n +1) | n <- [0..k]]

aprox' :: Int -> Double -- Solves for x^2
aprox' k = 12 * sum [(-1)^n/fromIntegral ((n+1)^2) | n <- [0..k]]
