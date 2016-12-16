//
//  InputController.swift
//  CalculatorProgect
//
//  Created by AdminAccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit




class InputController: UIViewController, InputInterface {
 
    
    
    var mainVC: InputInterface? = nil
    
     var buttonDidPress: ((_ operation: String)->())? = nil
    
    // jdfjgdj
    

    
    //MARK: - Actions - Digits Pressed

    @IBAction func touchDigitAction(_ sender: UIButton) {
       
        buttonDidPress?(sender.currentTitle!)
        
        
    }
    
    //MARK: - Actions - Binary Operations

    @IBAction func binaryOperationAction(_ sender: UIButton) {
    
       buttonDidPress?(sender.currentTitle!)


    }

    //MARK: - Actions - Unary Operations

    @IBAction func unaryOperationAction(_ sender: UIButton) { //when unary button pressed
        
    
        buttonDidPress?(sender.currentTitle!)

        
    }
    
    //MARK: - Actions - Equal and additional operations

    @IBAction func equalsAction(_ sender: UIButton) {
        
        buttonDidPress?(sender.currentTitle!)

    }
    
    @IBAction func clearAction(_ sender: UIButton) {

        buttonDidPress?(sender.currentTitle!)

        
    }
}
