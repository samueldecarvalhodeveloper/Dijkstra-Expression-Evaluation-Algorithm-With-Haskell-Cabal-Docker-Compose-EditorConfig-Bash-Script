module ExpressionParser (getEvaluatedResultFromExpression) where

import ParenthesesParser (getSolvedParenthesesExpression)
import Text.Read (readMaybe)

getEvaluatedResultFromExpression :: [String] -> [String] -> [Double] -> Double
getEvaluatedResultFromExpression [] _ numberStack
    | null numberStack = error "No values to return"
    | otherwise = case numberStack of
        [] -> error "No values to return"
        (result:_) -> result
getEvaluatedResultFromExpression (currentToken:remainingTokens) operatorStack numberStack
    | currentToken == "(" = getEvaluatedResultFromExpression remainingTokens operatorStack numberStack
    | currentToken == ")" = case operatorStack of
        [] -> error "Mismatched parentheses"
        (operator:remainingOperators) ->
            let updatedValues = getSolvedParenthesesExpression operator remainingOperators numberStack
            in getEvaluatedResultFromExpression remainingTokens remainingOperators updatedValues
    | currentToken `elem` ["+", "-", "*", "/", "sqrt"] =
        getEvaluatedResultFromExpression remainingTokens (currentToken:operatorStack) numberStack
    | otherwise = case readMaybe currentToken of
        Just number -> getEvaluatedResultFromExpression remainingTokens operatorStack (number:numberStack)
        Nothing -> error "Invalid input token"
