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
    private var brain: CalculatorBrain = CalculatorBrain()          //to communicate with CalcBrain

    
    var outputController: OutputController? = nil
    var inputController: InputController? = nil
    
       private var currentInput: Double {     //transforms string format into Double
    
            get {
                return Double((self.outputController?.displayView.text!)!)!
            }
            set {
                self.outputController?.displayView.text = "\(newValue)"
                typingInProcess = false
            }    
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerEmbedSegue" {
        outputController = segue.destination as? OutputController                //swift casting
        //outputController?.mainVC = self
        } else if segue.identifier == "InputControllerEmbedSegue"{
        inputController = segue.destination as?InputController
        inputController?.buttonDidPress = { string in  //call back function from inputController that catches string from button title
            
         //   self.buttonDidPress(operation: string)
   
            
        //inputController?.mainVC = self
        }
    }
   
    func digitPressed(operation : String) {
        
        
        if  typingInProcess {
            
            if (self.outputController?.displayView.text?.characters.count)! < 20 {         //will not display more than 20 charachters
                self.outputController?.displayView.text! = (self.outputController?.displayView.text!)! + operation       //adds newly pressed number to the previous one
            }
        } else {
            
            self.outputController?.displayView.text = operation
        }
        typingInProcess = true

    }
    
    func binaryOperationButtonPressed(operation : String) {
            if typingInProcess {
            brain.digit(value: currentInput)                    //sets operand
            brain.saveBinaryOperationSymbol(symbol: operation)           //saves binary oper symbol
            typingInProcess = false
            }
    }

    func unaryOperationButtonPressed(operation : String) {
        
                if typingInProcess {
                    brain.digit(value: currentInput)                            //sets operand
                    //            typingInProcess = false
        
                }
        
                brain.result = { (resultValue, error)->() in
                    self.outputController?.displayView.text = String(describing: resultValue!)       //shows result of the unary operation on display
                }
        
                switch operation {           //connects symbol with unary func and enumof unary operations
                case "√": brain.unary(operation: UnaryOperation.SquareRoot)
                case "+/-": brain.unary(operation: UnaryOperation.PlusMinus)
                case "cos": brain.unary(operation: UnaryOperation.Cos)
                case "sin": brain.unary(operation: UnaryOperation.Sin)
                case "tg": brain.unary(operation: UnaryOperation.Tan)
                case "%": brain.unary(operation: UnaryOperation.Percent)
                default:
                    break
                }
//

    }
    
    func equalsButtonPressed(operation : String) {
        
                brain.result = { (resultValue, error)->() in
                    self.outputController?.displayView.text = String(describing: resultValue!)        //displays result
                }
        
                brain.digit(value: currentInput)                        //saves second operand
                brain.utility(operation: UtilityOperation.Equal)        //connected to func utility in brain
        
    }
    
    func clearButtonPressed(operation : String) {
                brain.operandOne = nil
                brain.operandTwo = nil
                currentInput = 0
                self.outputController?.displayView.text = "0"
                typingInProcess = false
                brain.operationSymbol = nil
    }
    
    func buttonDidPress (operation: String) {
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
        default: break
        }

    
    }

    }
}
