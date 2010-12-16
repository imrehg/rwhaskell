-- file ch03/ex08.hs
data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)
treeHeight :: Tree t -> Int
treeHeight Empty = 0
treeHeight (Node _ left right) = if a >= b
                                 then a + 1
                                 else b + 1
                                   where a = treeHeight left
                                         b = treeHeight right