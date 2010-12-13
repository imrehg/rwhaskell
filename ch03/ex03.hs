-- file ch03/ex03.hs
-- Write a function that computes the mean of a list, i.e. the sum of all
-- elements in the list divided by its length. (You may need to use the
-- fromIntegral function to convert the length of the list from an integer
-- into a floating point number.)

-- 1) tuples and laziness
mean :: [Double] -> Double
mean [] = error "mean: empty list"
mean val = snd(inner val) / fst(inner val)
  where inner [] = (0, 0)
        inner (x:xs) = (fst(inner xs) + 1, snd(inner xs) + x)
-- This looks like double recursion (and would become exponential),
-- but the lazy evaluation makes it into two travesals. One could
-- create two separate functions as well, though...

-- 2) List comprehension, though it uses built in function
listMean :: [Double] -> Double
listMean [] = error "listMean: empty list"
listMean xs = sum xs / length' xs where length' xs = sum [1 | _ <- xs]