module ExpressionEvaluator (getResult) where

import ExpressionParser (getEvaluatedResultFromExpression)

getResult :: String -> Double
getResult expression =
    let tokenList = words expression
    in getEvaluatedResultFromExpression tokenList [] []
