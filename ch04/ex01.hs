-- file: ch04/ch04.exercises.hs
--safeTail :: [a] -> Maybe [a]
--safeLast :: [a] -> Maybe a
--safeInit :: [a] -> Maybe [a]


safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail x = Just (tail x)

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast x = Just (last x)

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit x = Just (init x)
