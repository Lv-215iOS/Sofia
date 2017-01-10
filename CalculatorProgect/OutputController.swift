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
    
    var arrayWithColorSets = Array<ColorSet>()
    
    func outputDisplayText(_ value: String) {
        displayView.text = value
    }
    func displayTextValue() -> String {
        return displayView.text ?? ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        settingTheme()
    }
    
    func settingTheme() {
        
        let objectFromUserDefaults = UserDefaults.standard.integer(forKey: "chosenColorSet")
        var colorSet = ColorSet()
        
        arrayWithColorSets = ColorSetGenerator.sharedInstance.generateColorSetsArray()
        colorSet = arrayWithColorSets[objectFromUserDefaults]
        
        self.view.backgroundColor = colorSet.colorD
        displayView.textColor = colorSet.colorB
        
    }
    
    func shakeOutputText() {//animates label
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x:displayView.center.x, y:displayView.center.y + 5)
        animation.toValue = CGPoint(x:displayView.center.x, y:displayView.center.y - 5)
        
        displayView.layer.add(animation, forKey: "position")
    }
}
