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
    
    var typingInProcess = false
    
    @IBAction private func clickDigitAction(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        if typingInProcess {
        let currentDisplayText = displayView.text!
            displayView.text = currentDisplayText + digit
        } else {
        displayView.text = digit
        }
        typingInProcess = true
    }
    var displayValue: Double {
        
        get {
        return Double(displayView.text!)!
        }
        set {
            displayView.text = String(newValue)
        }
    }
    
 private var brain = CalculatorModel()
    
    @IBAction private func operationsAction(_ sender: UIButton) {
        
        if typingInProcess {
            brain.setOperand(operand: displayValue)
            typingInProcess = false
            }
        if let mathematicalSymbol = sender.currentTitle {
        brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
    

    
}

