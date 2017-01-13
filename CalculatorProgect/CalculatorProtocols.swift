//
//  CalculatorProtocols.swift
//  CalculatorProgect
//
//  Created by AdminAccount on 12/16/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import Foundation

enum BinaryOperation: String {
    case Plus = "+"
    case Minus = "-"
    case Mul = "×"
    case Div = "÷"
    case Power = " ̂"
    case Mod = "%"
}

enum UnaryOperation: String {
    case Percent = "%"
    case Sin = "sin"
    case Cos = "cos"
    case Tg = "tg"
    case Ctg = "ctg"
    case Sinh = "sinh"
    case Cosh = "cosh"
    case Tgh = "tgh"
    case Ctgh = "ctgh"
    case Ln = "ln"
    case Sqrt = "√"
    case PlusMinus = "+/-"
    case Log = "log"
    case Fact = "!"
}

enum UtilityOperation: String {
    case Dot = "."
    case Equal = "="
    case Clean = "C"
    case RightBracket = ")"
    case LeftBracket = "("
    case AClean = "AC"
    case MPlus = "M+"
    case MMinus = "M-"
    case MClear = "MC"
    case MRead = "MR"
}

protocol CalcBrainInterface {
    func digit(value: Double)
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation)
    var result: ((Double?, Error?)->())? {get set}//is being called ONLY if equal pressed
}

protocol InputInterface {
    var buttonDidPress: ((_ operation: String)->())? {get set}
}

protocol OutputInterface {
    func outputDisplayText(_: String)
}
