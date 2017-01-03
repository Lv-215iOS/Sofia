//
//  OutputController.swift
//  CalculatorProgect
//
//  Created by AdminAccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//


import UIKit

class OutputController: UIViewController, OutputInterface {
    
    @IBOutlet weak var displayView: UILabel!
    
    func outputDisplayText(_ value: String) {
        
//        let formatted = String(format: "%g", Float(value)!)
//        displayView.text = formatted
        
        displayView.text = value
    }
    func displayTextValue() -> String {
        return displayView.text ?? ""
    }
}
