data KeyValue k v = KeyValue k v deriving (Show)
data Map a b = Empty | Node (KeyValue a b) (Map a b) (Map a b) deriving (Show)

empty :: Map k v
empty = Empty

insert :: Ord k => k -> v -> Map k v -> Map k v
insert k v (Empty) = Node (KeyValue k v) Empty Empty
insert k v (Node (KeyValue a b) m1 m2)
    | k < a  = Node (KeyValue a b) (insert k v m1) m2
    | k == a = Node (KeyValue k v) m1 m2 
    | k > a  = Node (KeyValue a b) m1 (insert k v m2)

-- Named this function look instead of lookup
-- to avoid collision with Prelude.lookup
look :: Ord k => k -> Map k v -> Maybe v
look k Empty = Nothing
look k (Node (KeyValue a b) m1 m2)
    | k == a = Just b
    | k < a = look k m1
    | k > a = look k m2
