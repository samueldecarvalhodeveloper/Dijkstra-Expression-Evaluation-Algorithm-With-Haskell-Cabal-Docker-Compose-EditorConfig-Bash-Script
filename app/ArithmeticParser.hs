module ArithmeticParser (getEvaluatedArithmeticExpressionNumber) where

getEvaluatedArithmeticExpressionNumber :: String -> Double -> Double -> Double
getEvaluatedArithmeticExpressionNumber "+" firstNumber secondNumber = firstNumber + secondNumber
getEvaluatedArithmeticExpressionNumber "-" firstNumber secondNumber = firstNumber - secondNumber
getEvaluatedArithmeticExpressionNumber "*" firstNumber secondNumber = firstNumber * secondNumber
getEvaluatedArithmeticExpressionNumber "/" firstNumber secondNumber = firstNumber / secondNumber
getEvaluatedArithmeticExpressionNumber _ _ _ = error "Unsupported operation"
