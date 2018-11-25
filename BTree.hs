module BTree where

data BTree a = Empty | Node a (BTree a) (BTree a)
  deriving (Eq, Show, Read)



size :: BTree a -> Integer
size Empty        = 0
size (Node _ l r) = size l + size r + 1

height :: BTree a -> Integer
height Empty        = 0
height (Node _ l r) = max (height l) (height r) + 1

fromList :: [a] -> BTree a
fromList []     = Empty
fromList (x:xs) = Node x Empty (fromList xs)

make :: [a] -> BTree a
make [] = Empty
make xs = Node z (make ys) (make zs)
  where
    m = length xs `div` 2
    (ys, z:zs) = splitAt m xs

searchTree :: Ord a => [a] -> BTree a
searchTree = foldr insert Empty
  where
    insert x Empty = Node x Empty Empty
    insert x (Node y l r)
      | x < y     = Node y (insert x l) r
      | otherwise = Node y l (insert x r)
        
flatten :: BTree a -> [a]
flatten Empty        = []
flatten (Node x l r) = flatten l ++ [x] ++ flatten r



getVal :: BTree a -> [a]
getVal Empty = []
getVal (Node x l r)  = [x]
 
levels :: BTree a -> [[a]]
levels (Node a Empty Empty) = [[a]]
levels (Node a l r) = [[a]] ++ sublevel
    where sublevel = mergelists (levels l)  (levels r) 

mergelists :: [[a]] -> [[a]] -> [[a]]
mergelists [] [] = []
mergelists [] (x:xs) = (x:xs)
mergelists (x:xs) [] = (x:xs)
mergelists (x:xs) (y:ys) = [x ++ y] ++ mergelists xs ys

--levels (Node 1 (Node 2 Empty Empty) (Node 3 Empty Empty))