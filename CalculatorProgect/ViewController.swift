//
//  ViewController.swift
//  CalculatorProgect
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var displayView: UILabel!
    
    private var typingInProcess = false
    
    private var brain: CalculatorBrain = CalculatorBrain()          //to communicate with CalcBrain

    
    
     private var currentInput: Double {     //transforms string format into Double
        
        get {
        return Double(displayView.text!)!
        }
        set {
        displayView.text = "\(newValue)"
            typingInProcess = false
        }
    
    }
    
    
   
//MARK: - Actions - Digits Pressed
    
    @IBAction private func clickDigitAction(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if  typingInProcess {
        
            if (displayView.text?.characters.count)! < 20 {         //will not display more than 20 charachters
                displayView.text = displayView.text! + number       //adds newly pressed number to the previous one
            }
        } else {
        
            displayView.text = number
     }
            typingInProcess = true
    }

    
    
//MARK: - Actions - Binary Operations

    
    @IBAction private func binaryOperationAction(_ sender: UIButton) {      //when binary button is pressed
        
        
        
        if typingInProcess {
            brain.digit(value: currentInput)                    //sets operand
            brain.saveBinaryOperationSymbol(symbol: sender.currentTitle!)           //saves binary oper symbol
            typingInProcess = false
        }
//       
//        if let operationSymbol = sender.currentTitle! {
//            brain.binary(operation: BinaryOperation)
//        }
//        
//        currentInput = brain.result
//        
        
        
    }

//MARK: - Actions - Unary Operations

    
    @IBAction func unaryOperationAction(_ sender: UIButton) {                   //when unary button pressed

        
        
        if typingInProcess {
            brain.digit(value: currentInput)                            //sets operand
//            typingInProcess = false

        }
        
        brain.result = { (resultValue, error)->() in
            self.displayView.text = String(describing: resultValue!)       //shows result of the unary operation on display
        }
        
        switch sender.currentTitle! {           //connects symbol with unary func and enumof unary operations
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
    
    
//MARK: - Actions - Equal and additional operations

    
    @IBAction func equalsAction(_ sender: UIButton) {
        
        brain.result = { (resultValue, error)->() in
            self.displayView.text = String(describing: resultValue!)        //displays result
        }

        brain.digit(value: currentInput)                        //saves second operand
        brain.utility(operation: UtilityOperation.Equal)        //connected to func utility in brain
                
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        
        brain.operandOne = nil
        brain.operandTwo = nil
        currentInput = 0
        displayView.text = "0"
        typingInProcess = false
        brain.operationSymbol = nil
    
    }
    




}

