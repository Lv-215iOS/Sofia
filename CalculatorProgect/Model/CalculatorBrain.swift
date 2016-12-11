//
//  CalculatorBrain.swift
//  CalculatorProgect
//
//  Created by Yuriy Lubinets on 12/10/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import Foundation

class CalculatorBrain: CalcBrainInterface {
    
    var operandOne: Double?
    var operandTwo: Double?
    
    var currentOperand: Double?
    
    
    
    var resultValue: Double?

    var operationSymbol: BinaryOperation?

    func digit(value: Double) {                          //sets operands
        if operandOne == nil {
            operandOne = value
        } else if operandTwo == nil {
            operandTwo = value
        }
    }
    
    func saveBinaryOperationSymbol(symbol: String){ //identifies case from enum as string of the symbol pressed
        switch symbol {
        case "+": operationSymbol = BinaryOperation.Plus
        case "-": operationSymbol = BinaryOperation.Minus
        case "×": operationSymbol = BinaryOperation.Mul
        case "÷": operationSymbol = BinaryOperation.Div
        default: break
        }
    }
    
    func binary(operation: BinaryOperation) {
        
       
        
        switch operation { //checks which button is pressed using symbol that was remembered in saveBinaryOperationSymbol
        case .Plus:
            resultValue = (operandOne ?? 0.0) + (operandTwo ?? 0.0)
            result?(resultValue, nil)
        case .Minus:
            resultValue = (operandOne ?? 0.0) - (operandTwo ?? 0.0)
            result?(resultValue, nil)
        case .Mul:
            resultValue = (operandOne ?? 0.0) * (operandTwo ?? 0.0)
            result?(resultValue, nil)
        case .Div:
            resultValue = (operandOne ?? 0.0) / (operandTwo ?? 0.0)
            result?(resultValue, nil)
        }
        
    }
    
    func resultValSaveAsCorrespOper() {                         //????????? consider replacing
        if resultValue != nil && operandTwo != nil {
            operandTwo = resultValue!
        } else if operandTwo == nil && operandOne != nil && resultValue != nil{
             operandOne = resultValue!
        }
    }
    
    func unary(operation: UnaryOperation) { //persorms unary operation
        
        if operandTwo != nil {                                  //sets current operand
        currentOperand = operandTwo!
        } else if operandTwo == nil && operandOne != nil {
        currentOperand = operandOne!
        }
        
        switch operation {
        case .SquareRoot:
       resultValue = sqrt(currentOperand!)
       
       resultValSaveAsCorrespOper()             //????????? consider replacing
       
//        operandTwo = resultValue

        result?(resultValue, nil)
            
            
        case .PlusMinus: break
            //currentInput = -currentInput
        case .Cos: break // currentInput = cos(currentInput)
        case .Sin: break //currentInput = sin(currentInput)
        case .Tan: break //currentInput = tan(currentInput)
        case .Percent: break //if currentInput >= 0 {
//            currentInput = currentInput / 100
//        } else {
//            displayView.text = "error"
//            }
        }
    }
    
    func utility(operation: UtilityOperation) {
        switch operation { //checks which button is pressed using symbol that was remembered in saveBinaryOperationSymbol
        case .Equal: if operationSymbol != nil {
            binary(operation: operationSymbol!)
            }
        case .Dot: break
        case .Clear: break
        }
    }
    
    var result: ((Double?, Error?)->())? = nil
    
    
    
    
}
