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
    
    @IBAction func clickDigitAction(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        if typingInProcess {
        let currentDisplayText = displayView.text!
            displayView.text = currentDisplayText + digit
        } else {
        displayView.text = digit
        }
        typingInProcess = true
    }
    
    @IBAction func operationsActions(_ sender: UIButton) {
    
    }
    
    @IBAction func equalsAction(_ sender: UIButton) {
    
    }
    
    func performOperations () {
    
    }
    
    

    
}

