//
//  InputController.swift
//  CalculatorProgect
//
//  Created by AdminAccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class InputController: UIViewController, InputInterface {
    
    var buttonDidPress: ((_ operation: String)->())? = nil
    
    
    //MARK: - Actions
    
    @IBAction func touchDigitAction(_ sender: UIButton) {
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func binaryOperationAction(_ sender: UIButton) {
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func unaryOperationAction(_ sender: UIButton) {
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func equalsAction(_ sender: UIButton) {
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        buttonDidPress?(sender.currentTitle!)
    }

    @IBAction func dotAction(_ sender: UIButton) {
        buttonDidPress?(sender.currentTitle!)
    }
}
