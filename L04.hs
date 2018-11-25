module L04 where
import BTree

data List a = Nil | Cons a (List a)
  deriving (Eq, Show, Read)

sort :: Ord a => [a] -> [a]
sort = flatten . searchTree
