-- file: ch04/EfficientList.hs
-- We don't need to check the length of a list to know if there are any
-- elements. Especially, because e.g. (null []) is True in Haskell
-- This also shows better what are we interested in (not the length but the
-- non-emptyness
mySmarterExample xs = if not (null xs)
                      then head xs
                      else 'Z'

-- delegate the explicit check to Haskell itself
mySmarterSimplerExample (x:_) = x
mySmarterSimplerExample [] = 'Z'

-- The above ones have the problem that the output of [] and 'Z' are the same
-- From the comments, a better way is probably this:
myOtherExample :: [t] -> Maybe t
myOtherExample (x:_) = Just x
myOtherExample [] = Nothing