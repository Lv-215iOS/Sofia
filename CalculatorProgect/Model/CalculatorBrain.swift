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
    
    private var typingInProcess = false
    
    var displayText: String = ""
    
    func digit(value: Double) {//sets operands
        
        if  typingInProcess {
            if displayText.characters.count < 10 {//will not display more than 10 digits pressed
                if displayText == "0" {//tracks 0 and replaces it with next symbol pressed
                    result?(value, nil)
                    displayText = NSString(format: "%.14g", value) as String
                }else {
                    displayText = displayText + (NSString(format: "%.14g", value) as String)
                    result?(Double(displayText), nil)
                }
            }
        } else {
            result?(value, nil)
            displayText = NSString(format: "%.14g", value) as String
        }
        typingInProcess = true
        
        
        
        if operandOne == nil {
            operandOne = Double(displayText)
        } else if operandTwo == nil {
            operandTwo = Double(displayText)
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
        
        if typingInProcess == true && operandOne != nil && operandTwo == nil {
            
            saveBinaryOperationSymbol(symbol: operation.rawValue)//saves binary oper symbol
            typingInProcess = false
        } else if typingInProcess == true && operandOne != nil && operandTwo != nil{//for multiple operations and operations after "="
            performBinaryOperation()
            operandOne = resultValue
            
            operandTwo = nil
            resultValue = nil
            
            saveBinaryOperationSymbol(symbol: operation.rawValue)//saves binary oper symbol
            typingInProcess = false
            
        } else {
            saveBinaryOperationSymbol(symbol: operation.rawValue)//saves binary oper symbol
        }
        
        
        
    }
    func performBinaryOperation() {
        if operationSymbol == BinaryOperation(rawValue: "+") {
            resultValue = (operandOne ?? 0.0) + (operandTwo ?? 0.0)
            result?(resultValue, nil)
        } else if operationSymbol == BinaryOperation(rawValue: "-") {
            resultValue = (operandOne ?? 0.0) - (operandTwo ?? 0.0)
            result?(resultValue, nil)
        }  else if operationSymbol == BinaryOperation(rawValue: "×") {
            resultValue = (operandOne ?? 0.0) * (operandTwo ?? 0.0)
            result?(resultValue, nil)
        } else if operationSymbol == BinaryOperation(rawValue: "÷") {
            resultValue = (operandOne ?? 0.0) / (operandTwo ?? 0.0)
            result?(resultValue, nil)
        }
    }
    
    
    func unary(operation: UnaryOperation) {//persorms unary operation
        switch operation {
        case .Sqrt:
            resultValue = sqrt(Double(displayText)!)
            resetOperand()
            
            result?(resultValue, nil)
            
        case .PlusMinus: if Double(displayText)! == 0 {
            resultValue = 0
        } else {
            resultValue = -Double(displayText)!
            resetOperand()
            result?(resultValue, nil)
            }
        case .Cos:
            resultValue = cos(Double(displayText)!)
            resetOperand()
            
            result?(resultValue, nil)
        case .Sin:
            resultValue = sin(Double(displayText)!)
            resetOperand()
            
            result?(resultValue, nil)
        case .Tg:
            resultValue = tan(Double(displayText)!)
            resetOperand()
            
            result?(resultValue, nil)
        case .Percent:
            if Double(displayText)! >= 0 {
                resultValue = Double(displayText)! / 100
                resetOperand()
                
                result?(resultValue, nil)
            } else {
                resultValue = nil
                resultValue = Double(displayText)!
                resetOperand()
                
                result?(resultValue, nil)
            }
        default: break
        }
    }
    
    func utility(operation: UtilityOperation) {
        
        switch operation {
        case .Equal:
            if operationSymbol != nil {
                performBinaryOperation()
                
                if operandOne != nil && operandTwo != nil {
                    operandOne = resultValue//saves result as the 1st operand. 2nd remains the same and is operated after multiple "="
                    self.displayText = NSString(format: "%.14g", operandOne!) as String
                }
                //                typingInProcess = false
            }
        case .Clean:
            clearButtonPressed()
        case .Dot:
         settingDot()
            
        default: break
        }
    }
    
    var result: ((Double?, Error?)->())? = nil
    
    //MARK: Additional funcs
    
    func clearButtonPressed() {
        operandOne = nil
        operandTwo = nil
        displayText = "0"
        typingInProcess = false
        resultValue = nil
        operationSymbol = nil
        result?(Double(displayText), nil)
    }
    func resetOperand() {
        if operandOne != nil && operandTwo == nil {
            operandOne = resultValue
        } else if operandTwo != nil && operandOne != nil {
            operandTwo = resultValue
        }
        //        } else if typingInProcess == false && operandTwo != nil && operandOne != nil {
        //            operandOne = resultValue
        //        }
    }
    
    func settingDot() {
    
        let dotIsPlaced = displayText.characters.contains(".")
        
        if !dotIsPlaced {
            if typingInProcess {
                if operandOne != nil && operandTwo == nil {
                    operandOne = nil
                } else if operandTwo != nil && operandOne != nil {
                    operandTwo = nil
                }
                displayText = displayText + "."
                result?(Double(displayText), nil)
            } else {
                if operandOne != nil && operandTwo == nil {
                    operandOne = nil
                } else if operandTwo != nil && operandOne != nil {
                    operandTwo = nil
                }
                displayText = "0."
                typingInProcess = true
                result?(Double(displayText), nil)

            }
        } else if !typingInProcess {//after binary and dot is already placed; after second binary func
            if operandOne != nil && operandTwo == nil {
                operandOne = nil
            } else if operandTwo != nil && operandOne != nil {
                operandTwo = nil
            }
            displayText = "0."
            typingInProcess = true
            result?(Double(displayText), nil)

        }
        if resultValue != nil && typingInProcess == true {//works after "="
            operandOne = nil
            operandTwo = nil
            resultValue = nil
            displayText = "0."
            result?(Double(displayText), nil)

        }
    }
    
}
