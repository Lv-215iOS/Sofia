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
}
