//
//  InputController.swift
//  CalculatorProgect
//
//  Created by AdminAccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit


protocol InputInterface {
    var buttonDidPress: ((_ operation: String)->())? {get set}
}

class InputController: UIViewController, InputInterface {
    
    
    
    //var mainVC: InputInterface? = nil  //is a callback func
    
    var buttonDidPress: ((_ operation: String)->())? = nil
    
    
    //MARK: - Actions - Digits Pressed
    
    @IBAction func touchDigitAction(_ sender: UIButton) {
        
        buttonDidPress!(sender.currentTitle!)
        
        
    }
    
    //MARK: - Actions - Binary Operations
    
    @IBAction func binaryOperationAction(_ sender: UIButton) {
        
        buttonDidPress!(sender.currentTitle!)
        
        
    }
    
    //MARK: - Actions - Unary Operations
    
    @IBAction func unaryOperationAction(_ sender: UIButton) { //when unary button pressed
        
        
        buttonDidPress!(sender.currentTitle!)
        
        
    }
    
    //MARK: - Actions - Equal and additional operations
    
    @IBAction func equalsAction(_ sender: UIButton) {
        
        buttonDidPress!(sender.currentTitle!)
        
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        
        buttonDidPress!(sender.currentTitle!)
        
        
    }
}
