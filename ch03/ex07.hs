-- file ch03/ex07.hs
-- Define a function that joins a list of lists together using a separator value
-- intersperse :: (Show t) => Char -> [t] -> Char
intersperse :: Char -> [[Char]] -> [Char]
intersperse _ [] = ""
intersperse _ (x:[]) = x
intersperse delimiter (x:xs) = x ++ [delimiter] ++ intersperse delimiter xs
