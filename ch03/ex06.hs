-- file ch03/ex06.hs
-- Create a function that sorts a list of lists based on the length of each
-- sublist. (You may want to look at the sortBy function from the Data.List
-- module.)
import Data.List

longer :: [a] -> [b] -> Ordering
longer a b | length(a) > length(b) = GT |
             length(a) < length(b) = LT |
             length(a) == length(b) = EQ

listsort :: (Ord a) => [[a]] -> [[a]]
listsort [] = []
listsort list = sortBy longer list