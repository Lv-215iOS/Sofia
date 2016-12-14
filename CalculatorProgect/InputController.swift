//
//  InputController.swift
//  CalculatorProgect
//
//  Created by AdminAccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

protocol Input {
    //func callback -> type of what is pressed
    //rewrite IBActions here
    //it can catch string for example, and send it through ViewController to Brain
    //VC should not do anything, just catch segue, and transfer info

}

class InputController: UIViewController, Input {
 
    
    
    var mainVC: ViewController? = nil
    
    
    
    // jdfjgdj
    

    
    //MARK: - Actions - Digits Pressed

    @IBAction func touchDigitAction(_ sender: UIButton) {
       
        mainVC?.digitPressed(operation: sender.currentTitle!)
        
        
    }
    
    //MARK: - Actions - Binary Operations

    @IBAction func binaryOperationAction(_ sender: UIButton) {
    
       mainVC?.binaryOperationButtonPressed(operation: sender.currentTitle!)


    }

    //MARK: - Actions - Unary Operations

    @IBAction func unaryOperationAction(_ sender: UIButton) { //when unary button pressed
        
    
        mainVC?.unaryOperationButtonPressed(operation: sender.currentTitle!)

        
    }
    
    //MARK: - Actions - Equal and additional operations

    @IBAction func equalsAction(_ sender: UIButton) {
        
        mainVC?.equalsButtonPressed(operation: sender.currentTitle!)

    }
    
    @IBAction func clearAction(_ sender: UIButton) {

        mainVC?.ClearButtonPressed(operation: sender.currentTitle!)

        
    }
}
