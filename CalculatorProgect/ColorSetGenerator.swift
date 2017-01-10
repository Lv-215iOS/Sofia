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
        arrayWithColorSets.append(generateColorSetTwo())
        arrayWithColorSets.append(generateColorSetThree())
        arrayWithColorSets.append(generateColorSetFour())
        arrayWithColorSets.append(generateColorSetFive())
        
        return arrayWithColorSets
    }
    
    private func generateColorSetOne() -> ColorSet {
        
        let colorSet = ColorSet()
        
        colorSet.colorA = UIColor.init(colorLiteralRed: 40.0 / 255.0, green: 110.0 / 255.0, blue: 131.0 / 255.0, alpha: 0.92)//dark
        colorSet.colorB = UIColor.init(colorLiteralRed: 70.0 / 255.0, green: 149.0 / 255.0, blue: 161.0 / 255.0, alpha: 0.89)//light
        colorSet.colorC = UIColor.init(colorLiteralRed: 39.0 / 255.0, green: 105.0 / 255.0, blue: 105.0 / 255.0, alpha: 0.9)//equal
        colorSet.colorD = UIColor.init(colorLiteralRed: 230.0 / 255.0, green: 229.0 / 255.0, blue: 231.0 / 255.0, alpha: 1.0)// background
        colorSet.setIcon = "turquoiseSet"
        colorSet.setName = "Turquoise"
        
        return colorSet
    }
    private func generateColorSetTwo() -> ColorSet {
        
        let colorSet = ColorSet()
        
        colorSet.colorA = UIColor.init(colorLiteralRed: 95.0 / 255.0, green: 50.0 / 255.0, blue: 68.0 / 255.0, alpha: 1.0)
        colorSet.colorB = UIColor.init(colorLiteralRed: 173.0 / 255.0, green: 115.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
        colorSet.colorC = UIColor.init(colorLiteralRed: 71.0 / 255.0, green: 30.0 / 255.0, blue: 46.0 / 255.0, alpha: 0.89)
        colorSet.colorD = UIColor.init(colorLiteralRed: 230.0 / 255.0, green: 229.0 / 255.0, blue: 231.0 / 255.0, alpha: 1.0)
        colorSet.setIcon = "violetSet"
        colorSet.setName = "Violet"
        
        return colorSet
    }
    private func generateColorSetThree() -> ColorSet {
        
        let colorSet = ColorSet()
        
        colorSet.colorA = UIColor.init(colorLiteralRed: 128.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        colorSet.colorB = UIColor.init(colorLiteralRed: 186.0 / 255.0, green: 100.0 / 255.0, blue: 102.0 / 255.0, alpha: 0.89)
        colorSet.colorC = UIColor.init(colorLiteralRed: 205.0 / 255.0, green: 92.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
        colorSet.colorD = UIColor.init(colorLiteralRed: 230.0 / 255.0, green: 229.0 / 255.0, blue: 231.0 / 255.0, alpha: 1.0)
        colorSet.setIcon = "marsalaSet"
        colorSet.setName = "Marsala"
        
        return colorSet
        
    }
    private func generateColorSetFour() -> ColorSet {
        
        let colorSet = ColorSet()
        
        colorSet.colorA = UIColor.init(colorLiteralRed: 85.0 / 255.0, green: 107.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        colorSet.colorB = UIColor.init(colorLiteralRed: 157.0 / 255.0, green: 177.0 / 255.0, blue: 82.0 / 255.0, alpha: 1.0)
        colorSet.colorC = UIColor.init(colorLiteralRed: 107.0 / 255.0, green: 142.0 / 255.0, blue: 35.0 / 255.0, alpha: 0.89)
        colorSet.colorD = UIColor.init(colorLiteralRed: 230.0 / 255.0, green: 229.0 / 255.0, blue: 231.0 / 255.0, alpha: 1.0)
        colorSet.setIcon = "oliveSet"
        colorSet.setName = "Olive"
        
        return colorSet
        
    }
    
    private func generateColorSetFive() -> ColorSet {
        
        let colorSet = ColorSet()
        
        colorSet.colorA = UIColor.init(colorLiteralRed: 184 / 255.0, green: 134 / 255.0, blue: 11.0 / 255.0, alpha: 1.0)
        colorSet.colorB = UIColor.init(colorLiteralRed: 181.0 / 255.0, green: 177.0 / 255.0, blue: 131.0 / 255.0, alpha: 1.0)
        colorSet.colorC = UIColor.init(colorLiteralRed: 218 / 255.0, green: 165.0 / 255.0, blue: 32.0 / 255.0, alpha: 0.89)
        colorSet.colorD = UIColor.init(colorLiteralRed: 230.0 / 255.0, green: 229.0 / 255.0, blue: 231.0 / 255.0, alpha: 1.0)
        colorSet.setIcon = "goldenRodSet"
        colorSet.setName = "Golden Rod"
        
        return colorSet
        
    }
    
}
