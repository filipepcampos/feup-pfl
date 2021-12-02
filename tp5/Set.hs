data Set a = Empty | Node a (Set a) (Set a) deriving (Show)

empty :: Set a
empty = Empty

isEmpty :: Set a -> Bool
isEmpty Empty = True
isEmpty _ = False

insert :: Ord a => a -> Set a -> Set a
insert n Empty = Node n Empty Empty
insert n (Node k a b)
    | n == k = Node k a b
    | n < k  = Node k (insert n a) b
    | otherwise = Node k a (insert n b)

member :: Ord a => a -> Set a -> Bool
member n Empty = False
member n (Node k a b)
    | n == k = True
    | n < k = member n a
    | otherwise = member n b