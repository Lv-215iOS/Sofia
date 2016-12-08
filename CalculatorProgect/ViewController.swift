//
//  ViewController.swift
//  CalculatorProgect
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayView: UILabel!
    
    var typingInProcess = false
    
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    
    var operationSymbol: String = ""
    
    var currentInput: Double {
        
        get {
        return Double(displayView.text!)!
        }
        set {
        displayView.text = "\(newValue)"
            typingInProcess = false
        }
    
    } //transforms format into Double
    
//MARK: - Actions - Digits Pressed
    
    @IBAction func clickDigitAction(_ sender: UIButton) {
        
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

    @IBAction func binaryOperationAction(_ sender: UIButton) {         //operations that include 2 operands
        
        equalsAction(sender) //how to use nil in swift?
        
        operationSymbol = sender.currentTitle!          //takes operation symbol from button title
        firstOperand = currentInput
        typingInProcess = false
    }
    
    func binaryOperation(operation: (Double, Double) ->Double) {
        currentInput = operation(firstOperand, secondOperand)
        typingInProcess = false
        
    }                                               //this func takes 2 doubles and returns 1 doulble
                                                    //here we use two operands we created earlier
    
//MARK: - Actions - Equal and additional operations

    
    @IBAction func equalsAction(_ sender: UIButton) {
    
        if typingInProcess {
            secondOperand = currentInput    //saves secondOperand
        }
        
        
        switch operationSymbol { //checks which button is pressed using symbol that was remembered in binaryOperationAction
            case "+":
                binaryOperation {$0 + $1}
            case "-":
                binaryOperation {$0 - $1}
            case "×":
                binaryOperation {$0 * $1}
            case "÷":
                binaryOperation {$0 / $1}         //using closures here $0 and $1 are replaced with corresponding operands
            default: break
        }
        
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayView.text = "0"
        typingInProcess = false
        operationSymbol = ""
    
    }
    
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func squareRootButtonPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }

    @IBAction func dotButtonPressed(_ sender: UIButton) {
        
        displayView.text = displayView.text! + "."
        

    }
    @IBAction func eButtonPressed(_ sender: UIButton) {
        currentInput = M_E
    }
    
    @IBAction func piButtonPressed(_ sender: UIButton) {
        currentInput = M_PI
    }
    
    @IBAction func cosButtonPressed(_ sender: UIButton) {
        currentInput = cos(currentInput)
    }

    @IBAction func sinButtonPressed(_ sender: UIButton) {
       currentInput = sin(currentInput)
    }
    
    @IBAction func tgButtonPressed(_ sender: UIButton) {
        currentInput = tan(currentInput)
    }



}

