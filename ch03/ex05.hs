-- file ch03/ex05.hs
-- Write a function that determines whether its input list is a palindrome.
isPali :: (Eq a) => [a] -> Bool
isPali [] = True
isPali (x:[]) = True
isPali (x:xs) = x == last(xs) && isPali(init xs)
-- init is defined as: init (xs) = take (length xs - 1) xs