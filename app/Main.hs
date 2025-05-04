module Main where

import ExpressionEvaluator (getResult)

main :: IO ()
main = do
    let expression = "( 2 + 2 )"

    let result = getResult expression

    putStrLn "Expression To Be Parsed:"

    putStrLn ""

    putStrLn expression

    putStrLn ""

    putStrLn "Parsed Expression:"

    putStrLn ""

    print result
