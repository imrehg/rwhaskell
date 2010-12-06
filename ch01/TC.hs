-- file: ch01/TC.hs
-- run it as runghc TC < inputfile
-- compare this with the counts of "wc -m -w -l < inputfile"

main = interact textCount
  where textCount input = show (length (lines input)) ++ " "
                          ++ show (length(words input)) ++ " "
                          ++ show (length input) ++ "\n"



