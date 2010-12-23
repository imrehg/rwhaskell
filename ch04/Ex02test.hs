import Test.HUnit
import Ex02

testString = TestList [ "Empty string" ~: [] ~=? (splitWith (/='b') "")
                      , "No splitt" ~: ["aaa"] ~=? (splitWith (/='b') "aaa")
                      , "Only delimiter" ~: [] ~=? (splitWith (/='b') "bbb")
                      , "On start" ~: ["aaa"] ~=? (splitWith (/='b') "bbbaaa")
                      , "On end" ~: ["aaa"] ~=? (splitWith (/='b') "aaabbb")
                      , "Middle" ~: ["aaa","aaa"] ~=? (splitWith (/='b') "aaabbbaaa")
                      , "Many" ~: ["a","a","a","a"] ~=? (splitWith (/='b') "babababa")
                      , "Words" ~: (words " abc de fghi j ") ~=? (splitWith (\x -> x/=' ') " abc de fghi j ")
                      ]

testLists = TestList [ "Complex" ~: [[2,4],[8,10],[12,14]] ~=? (splitWith even [2,4,1,3,5,8,10,3,12,14,5])
                     , "None" ~: [[1],[3]] ~=? (splitWith odd [1,2,3,4])
                     ]

main = runTestTT $ TestList [ testLists, testString]
