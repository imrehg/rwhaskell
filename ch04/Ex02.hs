-- file: ch04/ch04.exercises.hs
-- Write a function splitWith that acts similarly to words,
-- but takes a predicate and a list of any type, and splits
-- its input list on every element for which the predicate returns False.
module Ex02 where

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith pred x 
   | (null front) && (null back) = []:[]
   | null front = splitWith pred (tail back)
   | null back = [front]
   | otherwise = front : splitWith pred (tail back)
  where (front, back) = span pred x
