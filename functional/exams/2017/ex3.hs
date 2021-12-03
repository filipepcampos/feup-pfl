import Data.List(nub)

subs :: (Eq a) => [a] -> [[a]]
subs [] = [[]]
--subs xs = nub (xs : foldr (\x y -> x ++ y) [] [subs [x | (x,j) <- zip xs [0..], j /= i] | i <- [0.. length xs-1] ])
subs (x:xs) = [x:s | s <- subs xs] ++ subs xs

