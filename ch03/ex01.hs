-- file ch03/ex01.hs
-- Write a function that computes the number of elements in a list. 
-- To test it, ensure that it gives the same answers as the standard
-- length function.
elements :: [a] -> Int
elements [] = 0
elements (_:xs) = elements(xs) + 1

