import Data.Char

cifrar :: Int -> String -> String
cifrar n = map (shiftChar n)
shiftChar :: Int -> Char -> Char
shiftChar n c
    | isAsciiUpper c = chr (a + (ord c + n - a) `mod` (z-a))
    | otherwise = c
    where a = ord 'A'
          z = ord 'Z'
