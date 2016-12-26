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
    var resultValue: Double?
    var brainCurrentInput: Double?//in order to perform unary operation
    var operationSymbol: BinaryOperation?
    
    func digit(value: Double) {//sets operands
        if operandOne == nil {
            operandOne = value
        } else if operandTwo == nil {
            operandTwo = value
        }
    }
    
    func saveBinaryOperationSymbol(symbol: String){//identifies case from enum as string of the symbol pressed
        switch symbol {
        case "+": operationSymbol = BinaryOperation.Plus
        case "-": operationSymbol = BinaryOperation.Minus
        case "×": operationSymbol = BinaryOperation.Mul
        case "÷": operationSymbol = BinaryOperation.Div
        default: break
        }
    }
    
    func binary(operation: BinaryOperation) {
        switch operation {//checks which button is pressed using symbol that was remembered in saveBinaryOperationSymbol
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
    
    func unary(operation: UnaryOperation) {//persorms unary operation
        switch operation {
        case .SquareRoot:
            resultValue = sqrt(brainCurrentInput!)
            result?(resultValue, nil)
            
        case .PlusMinus: if brainCurrentInput == 0 {
            resultValue = 0
        } else {
            resultValue = -brainCurrentInput!
            result?(resultValue, nil)
            }
        case .Cos:
            resultValue = cos(brainCurrentInput!)
            result?(resultValue, nil)
        case .Sin:
            resultValue = sin(brainCurrentInput!)
            result?(resultValue, nil)
        case .Tan:
            resultValue = tan(brainCurrentInput!)
            result?(resultValue, nil)
        case .Percent: if brainCurrentInput! >= 0 {
            brainCurrentInput = brainCurrentInput! / 100
            resultValue = brainCurrentInput
            result?(resultValue, nil)
        } else {
            brainCurrentInput = nil
            resultValue = brainCurrentInput
            result?(resultValue, nil)
            }
        }
    }
    
    func utility(operation: UtilityOperation) {
        switch operation {
        case .Equal: if operationSymbol != nil {
            binary(operation: operationSymbol!)
            }
        default: break
        }
    }
    
    var result: ((Double?, Error?)->())? = nil
    
}
