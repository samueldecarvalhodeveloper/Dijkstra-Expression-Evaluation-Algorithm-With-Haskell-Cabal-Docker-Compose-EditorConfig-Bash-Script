module ParenthesesParser (getSolvedParenthesesExpression) where

import ArithmeticParser (getEvaluatedArithmeticExpressionNumber)

getSolvedParenthesesExpression :: String -> [String] -> [Double] -> [Double]
getSolvedParenthesesExpression operator _ valueStack
    | null valueStack = error "Not enough values for operation"
    | otherwise = case valueStack of
        (topValue1:topValue2:remainingValues) ->
            let newValue = if operator == "sqrt"
                           then sqrt topValue1
                           else getEvaluatedArithmeticExpressionNumber operator topValue2 topValue1
            in newValue : remainingValues
        _ -> error "Not enough values for operation"
