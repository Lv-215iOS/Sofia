//
//  CalcBrainInterface.swift
//  CalculatorProgect
//
//  Created by Yuriy Lubinets on 12/10/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import Foundation

enum BinaryOperation {
    case Plus
    case Minus
    case Mul
    case Div
}

enum UnaryOperation {
    case PlusMinus
    case SquareRoot
    case Cos
    case Sin
    case Tan
    case Percent
}

enum UtilityOperation {
    case Equal
    case Clear
    case Dot
}

protocol CalcBrainInterface {
    
    func digit(value: Double)
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation)
    var result: ((Double?, Error?)->())? {get set}   //is being called ONLY if equal pressed

}

