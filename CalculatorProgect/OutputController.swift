//
//  OutputController.swift
//  CalculatorProgect
//
//  Created by AdminAccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//


import UIKit

protocol Output {
    func output()
}
class OutputController: UIViewController, Output {
    
    var mainVC: ViewController? = nil
    
    func output() {
        
    }
    @IBOutlet weak var displayView: UILabel!
    
}
