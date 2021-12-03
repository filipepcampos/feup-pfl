import Data.Char

forte :: String -> Bool
forte str = and [length str > 8, any isLower str, any isUpper str, any isDigit str]
