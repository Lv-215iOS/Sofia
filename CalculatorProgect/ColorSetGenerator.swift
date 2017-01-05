//
//  ColorSetGenerator.swift
//  CalculatorProgect
//
//  Created by Yuriy Lubinets on 1/5/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class ColorSetGenerator: NSObject {
    
    static let sharedInstance = ColorSetGenerator()
    
    func generateColorSetsArray() -> Array<ColorSet> {
        var arrayWithColorSets: Array<ColorSet> = []
        arrayWithColorSets.append(generateColorSetOne())
        return arrayWithColorSets
    }

    private func generateColorSetOne() -> ColorSet {
        let colorSet = ColorSet()
        
        colorSet.colorA = UIColor.init(colorLiteralRed: 40.0 / 255.0, green: 110.0 / 255.0, blue: 131.0 / 255.0, alpha: 0.92)
        colorSet.colorB = UIColor.init(colorLiteralRed: 70.0 / 255.0, green: 149.0 / 255.0, blue: 161.0 / 255.0, alpha: 0.89)
        colorSet.colorC = UIColor.init(colorLiteralRed: 39.0 / 255.0, green: 105.0 / 255.0, blue: 105.0 / 255.0, alpha: 0.9)
        colorSet.colorD = UIColor.init(colorLiteralRed: 230.0 / 255.0, green: 229.0 / 255.0, blue: 231.0 / 255.0, alpha: 1.0)

        return colorSet
    }
//    private func generateColorSetTwo() -> ColorSet {
//        
//    }
//    private func generateColorSetThree() -> ColorSet {
//        
//    }
//    private func generateColorSetFour() -> ColorSet {
//        
//    }
}
