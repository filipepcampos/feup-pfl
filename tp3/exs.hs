import Data.List(insert)

-- Ex1
-- [f x | x <- xs, p x]
ex1 f p x = map f (filter p x)

-- Ex2
dec2intAdd a b = a * 10 + b

dec2int :: [Int] ->  Int
dec2int = foldl dec2intAdd 0

-- Ex3
-- zipWith f xs ys = [f x y | (x, y) ←zip xs ys]

zipWith0 :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith0 f xs ys = map (uncurry f) (zip xs ys)


zipWith1 :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith1 f xs ys = zipWithAux f (zip xs ys)
zipWithAux :: (a -> b -> c) -> [(a, b)] -> [c]
zipWithAux f [] = []
zipWithAux f (x:xs) = uncurry f x : zipWithAux f xs


-- Ex4
isort' :: Ord a => [a] -> [a]
isort' l = foldr (\x y -> insert x y) [] l


-- Ex5
-- a)
maximum' :: Ord a => [a] -> a
maximum' l = foldl1 max l

minimum' :: Ord a => [a] -> a
minimum' l = foldl1 min l

-- b) 
foldl1' f (x:xs) = foldl f x xs
foldr1' f l = foldr f (last l) (init l)

-- Ex6
mdc a b = fst (until (\t -> snd t == 0) (\(a, b) -> (b, a `mod` b)) (a,b))

-- Ex7
--  a) ++
myAppend :: [a] -> [a] -> [a]
myAppend l1 l2 = foldr (\x k -> x:k) l2 l1

--  b) concat
myConcat :: [[a]] -> [a]
myConcat l = foldr (\x k -> myAppend x k) [] l

--  c) reverse
myReverseR :: [a] -> [a]
myReverseR l = foldr (\x k -> k ++ [x]) [] l

myReverseL :: [a] -> [a]
myReverseL l = foldl (\k x -> x : k) [] l

--  d) elem (using any)
myElem :: Eq a => a -> [a] -> Bool
myElem e l = any (==e) l

-- Ex 3.8
palavras :: String -> [String]
palavras [] = []
palavras str
    | not (null foo) = word : palavras (tail foo)
    | otherwise = [word]
    where word = takeWhile (/=' ') str
          foo = dropWhile (/=' ') str

-- Ex 3.9
scanll:: (b -> a -> b) -> b -> [a] -> [b]
scanll f z [] = [z]
scanll f z (x:xs) = z : scanll f (f z x) xs