-- file: ch04/Ex03.hs
-- Using the command framework from the section called “A simple command line
-- framework”, write a program that prints the first word of each line of its 
-- input.

import System.Environment (getArgs)

interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

main = mainWith myFunction
    where mainWith function= do
            args <- getArgs
            case args of
              [input, output] -> interactWith function input output
              _ -> putStrLn "error: where are my two arguments?"

myFunction = fstWordLine.lines

fstWordLine :: [String] -> String
fstWordLine (x:xs) 
  | null x =  "\n" ++ fstWordLine xs
  | otherwise = head (words x) ++ "\n" ++ fstWordLine xs
fstWordLine _ = []

