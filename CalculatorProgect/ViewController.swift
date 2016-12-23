//
//  ViewController.swift
//  CalculatorProgect
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var typingInProcess = false
    private var dotIsPlaced = false
    private var brain: CalculatorBrain = CalculatorBrain()          //to communicate with CalcBrain
    
    var outputController: OutputController? = nil
    var inputController: InputController? = nil
    
    private var currentInput: Double {     //transforms string format into Double
        get {
            return Double(textValue())!
        }
        set {
            outputText(value:"\(newValue)")
            typingInProcess = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerEmbedSegue" {
            outputController = segue.destination as? OutputController                //swift casting
            //outputController?.mainVC = self
        } else if segue.identifier == "InputControllerEmbedSegue"{
            inputController = segue.destination as? InputController
            inputController?.buttonDidPress = { [ unowned self ] operation in  //callback func from inputController that catches button.title string
                self.buttonDidPress(operation: operation)
            }
        }
    }
    
    func digitPressed(operation : String) {
        if  typingInProcess {
            
            if (textValue().characters.count) < 16 {   //will not display more than 16 charachters
                outputText(value: textValue() + operation)
                //adds newly pressed digit to the previous one
            }
        } else {
            outputText(value: operation)
        }
            switch operation {
            case "π": currentInput = M_PI
            case "e": currentInput = M_E
            default: break
        }
        typingInProcess = true
    }
    
    func binaryOperationButtonPressed(operation : String) {
        typingInProcess = true
        if typingInProcess {
            brain.digit(value: currentInput)                    //sets operand
            brain.saveBinaryOperationSymbol(symbol: operation)           //saves binary oper symbol
            typingInProcess = false
        }
        
    }
    
    func unaryOperationButtonPressed(operation : String) {
        
        brain.brainCurrentInput = currentInput
        
        brain.result = { (resultValue, error)->() in
            self.outputText(value: String(describing: resultValue!)) //shows result of the unary operation on display
        }
        
        switch operation {           //connects symbol with unary func and enum of unary operations
        case "√": brain.unary(operation: UnaryOperation.SquareRoot)
        case "+/-": brain.unary(operation: UnaryOperation.PlusMinus)
        case "cos": brain.unary(operation: UnaryOperation.Cos)
        case "sin": brain.unary(operation: UnaryOperation.Sin)
        case "tg": brain.unary(operation: UnaryOperation.Tan)
        case "%": brain.unary(operation: UnaryOperation.Percent)
        default:
            break
        }
    }
    
    
    func equalsButtonPressed(operation : String) {
        brain.result = { (resultValue, error)->() in
            self.outputText(value: String(describing: resultValue!))       //displays result
        }
        if brain.operandOne != nil && brain.operandTwo != nil { //clearing operands in order to perform additional operations
            brain.operandOne = brain.resultValue
            brain.operandTwo = nil
        }
        brain.digit(value: currentInput) //saves second operand
        brain.utility(operation: UtilityOperation.Equal)        //connected to func utility in brain
        typingInProcess = false
    }
    
    func clearButtonPressed(operation : String) {
        brain.operandOne = nil
        brain.operandTwo = nil
        currentInput = 0
        outputText(value: "0")
        typingInProcess = false
        brain.resultValue = 0
        brain.operationSymbol = nil
    }
    
    func dotButtonPressed(operation: String){
        if !dotIsPlaced && typingInProcess {
            outputText(value: textValue() + ".")
            dotIsPlaced = true
        } else if !dotIsPlaced && !typingInProcess {
            brain.operandOne = nil
            brain.operandTwo = nil
            outputText(value: "0.")
            typingInProcess = true
            dotIsPlaced = true
        }
    }
    
    func buttonDidPress(operation: String){
        switch operation {
        case "1": digitPressed(operation: operation)
        case "2": digitPressed(operation: operation)
        case "3": digitPressed(operation: operation)
        case "4": digitPressed(operation: operation)
        case "5": digitPressed(operation: operation)
        case "6": digitPressed(operation: operation)
        case "7": digitPressed(operation: operation)
        case "8": digitPressed(operation: operation)
        case "9": digitPressed(operation: operation)
        case "0": digitPressed(operation: operation)
            
        case "π": digitPressed(operation: operation)
        case "e": digitPressed(operation: operation)
            
        case "+": binaryOperationButtonPressed(operation: operation)
        case "-": binaryOperationButtonPressed(operation: operation)
        case "÷": binaryOperationButtonPressed(operation: operation)
        case "×": binaryOperationButtonPressed(operation: operation)
            
        case "√": unaryOperationButtonPressed(operation: operation)
        case "cos": unaryOperationButtonPressed(operation: operation)
        case "sin": unaryOperationButtonPressed(operation: operation)
        case "tg": unaryOperationButtonPressed(operation: operation)
        case "%": unaryOperationButtonPressed(operation: operation)
        case "+/-": unaryOperationButtonPressed(operation: operation)
            
        case "=": equalsButtonPressed(operation: operation)
        case "C": clearButtonPressed(operation: operation)
        case ".": dotButtonPressed(operation: operation)
            
        default: break
        }
    }
    
    func outputText(value: String) {
    self.outputController?.outputDisplayText(value)
    }
    func textValue() -> String {
    return self.outputController?.displayTextValue() ?? ""
    }
    
}

