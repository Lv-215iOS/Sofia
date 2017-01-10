//
//  ViewController.swift
//  CalculatorProgect
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var typingInProcess = false
    private var brain: CalculatorBrain = CalculatorBrain()//to communicate with CalcBrain
    
    var outputController: OutputController? = nil
    var inputController: InputController? = nil
    
    @IBOutlet weak var musicStateButton: UIButton!
    
    private var currentInput: Double {//transforms string format into Double
        get {
            return Double(textValue()) ?? 0.0
        }
        set {
            outputText(value:"\(newValue)")
            typingInProcess = false
        }
    }
    
    override func viewDidLoad() {
        let musicIsPlaying = UserDefaults.standard.bool(forKey: "musicIsPlaying")
        if musicIsPlaying == false {
            stopMusic()
        } else {
            playMusic()
        }
    }
    
    //MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerEmbedSegue" {
            outputController = segue.destination as? OutputController//swift casting
        } else if segue.identifier == "InputControllerEmbedSegue"{
            inputController = segue.destination as? InputController
            inputController?.buttonDidPress = { [ unowned self ] operation in//callback func from inputController that catches button.title string
                self.buttonDidPress(operation: operation)
            }
        }
    }
    
    //MARK: Digit Pressed
    
    func digitPressed(operation : String) {
        if  typingInProcess {
            if (textValue().characters.count) < 10 {//will not display more than 10 digits pressed
                if textValue() == "0" {//tracks 0 and replaces it with next symbol pressed
                    outputText(value: operation)
                }else {
                    outputText(value: textValue() + operation)//adds newly pressed digit to the previous one
                }
            }
        } else {
            outputText(value: operation)
        }
        switch operation {
        case "π": currentInput = M_PI
        case "e": currentInput = M_E
        default: break
        }
        typingInProcess = true
    }
    
    //MARK: Binary operation pressed
    
    func binaryOperationButtonPressed(operation : String) {
        
        if typingInProcess == true && brain.operandOne == nil {
            brain.digit(value: currentInput)//sets operand
            brain.saveBinaryOperationSymbol(symbol: operation)//saves binary oper symbol
            typingInProcess = false
        } else if typingInProcess == true && brain.operandOne != nil {//for multiple operations and operations after "="
            brain.digit(value: currentInput)//sets operand
            brain.result = { (resultValue, error)->() in
                self.outputText(value: NSString(format: "%.14g", resultValue!) as String)//displays formatted result (5)
            }
            brain.utility(operation: UtilityOperation.Equal)//connected to func utility in brain - counts
            brain.operandOne = brain.resultValue
            brain.operandTwo = nil
            brain.resultValue = nil
            brain.saveBinaryOperationSymbol(symbol: operation)//saves binary oper symbol
            typingInProcess = false
        } else {
            brain.saveBinaryOperationSymbol(symbol: operation)//resets binary oper symbol
        }
    }
    
    //MARK: Unary operation pressed
    
    func unaryOperationProcessing(operation: String) {
        brain.result = { (resultValue, error)->() in
            if resultValue != nil {
                if (resultValue?.isNaN)! || (resultValue?.isInfinite)! {//checks for error
                    self.outputText(value: "Error")
                    self.outputController?.shakeOutputText()
                    self.nillingParameters()
                    
                } else {
                    self.outputText(value: NSString(format: "%.14g", resultValue!) as String)//displays formatted result
                }
            }
        }
        switch operation {//connects symbol with unary func and enum of unary operations
        case "√": brain.unary(operation: UnaryOperation.SquareRoot)
        case "+/-": brain.unary(operation: UnaryOperation.PlusMinus)
        case "cos": brain.unary(operation: UnaryOperation.Cos)
        case "sin": brain.unary(operation: UnaryOperation.Sin)
        case "tg": brain.unary(operation: UnaryOperation.Tan)
        case "%": brain.unary(operation: UnaryOperation.Percent)
        default:
            break
        }
        brain.brainCurrentInput = nil
        brain.resultValue = nil
    }
    
    func unaryOperationButtonPressed(operation : String) {
        brain.brainCurrentInput = currentInput
        if brain.operandTwo == nil {
            unaryOperationProcessing(operation: operation)
        } else if brain.resultValue != nil && brain.operandOne != nil {
            unaryOperationProcessing(operation: operation)
            brain.operandOne = nil
            brain.operandTwo = nil
        }
    }
    
    //MARK: Utility operation pressed
    
    func equalsButtonPressed(operation : String) {
        brain.result = { (resultValue, error)->() in
            if resultValue != nil {
                if (resultValue?.isNaN)! || (resultValue?.isInfinite)! {//checks for error
                    self.outputText(value: "Error")
                    self.outputController?.shakeOutputText()
                    self.nillingParameters()
                } else {
                    self.outputText(value: NSString(format: "%.14g", resultValue!) as String)//displays formatted result (5)
                }
            }
        }
        if brain.operandOne != nil && brain.operandTwo != nil {
            brain.operandOne = brain.resultValue//saves result as the 1st operand. 2nd remains the same and is operated after multiple "="
        }
        brain.digit(value: currentInput)//saves second operand
        brain.utility(operation: UtilityOperation.Equal)//connected to func utility in brain
    }
    
    func clearButtonPressed(operation : String) {
        brain.operandOne = nil
        brain.operandTwo = nil
        currentInput = 0
        outputText(value: "0")
        typingInProcess = false
        brain.resultValue = nil
        brain.operationSymbol = nil
    }
    
    func dotButtonPressed(operation: String){
        
        let dotIsPlaced = textValue().characters.contains(".")
        
        if !dotIsPlaced {
            if typingInProcess {
                outputText(value: textValue() + ".")
            } else {
                brain.operandTwo = nil
                outputText(value: "0.")
                typingInProcess = true
            }
        } else if !typingInProcess {//after binary and dot is already placed; after second binary func
            brain.operandTwo = nil
            outputText(value: "0.")
            typingInProcess = true
        }
        if brain.resultValue != nil && typingInProcess == true {//works after "="
            brain.operandOne = nil
            brain.operandTwo = nil
            brain.resultValue = nil
            outputText(value: "0.")
        }
    }
    
    //MARK: Additional functions
    
    func nillingParameters() {//in order errors and animations work properly
        brain.operandOne = nil
        brain.operandTwo = nil
        brain.resultValue = nil
        brain.operationSymbol = nil
        typingInProcess = false
    }
    
    func buttonDidPress(operation: String){//receives strings of button pressed in inputContr
        switch operation {
        case "1": digitPressed(operation: operation)
        case "2": digitPressed(operation: operation)
        case "3": digitPressed(operation: operation)
        case "4": digitPressed(operation: operation)
        case "5": digitPressed(operation: operation)
        case "6": digitPressed(operation: operation)
        case "7": digitPressed(operation: operation)
        case "8": digitPressed(operation: operation)
        case "9": digitPressed(operation: operation)
        case "0": digitPressed(operation: operation)
            
        case "π": digitPressed(operation: operation)
        case "e": digitPressed(operation: operation)
            
        case "+": binaryOperationButtonPressed(operation: operation)
        case "-": binaryOperationButtonPressed(operation: operation)
        case "÷": binaryOperationButtonPressed(operation: operation)
        case "×": binaryOperationButtonPressed(operation: operation)
            
        case "√": unaryOperationButtonPressed(operation: operation)
        case "cos": unaryOperationButtonPressed(operation: operation)
        case "sin": unaryOperationButtonPressed(operation: operation)
        case "tg": unaryOperationButtonPressed(operation: operation)
        case "%": unaryOperationButtonPressed(operation: operation)
        case "+/-": unaryOperationButtonPressed(operation: operation)
            
        case "=": equalsButtonPressed(operation: operation)
        case "C": clearButtonPressed(operation: operation)
        case ".": dotButtonPressed(operation: operation)
            
        default: break
        }
    }
    
    func outputText(value: String) {
        self.outputController?.outputDisplayText(value)
    }
    
    func textValue() -> String {
        return self.outputController?.displayTextValue() ?? ""
    }
    
    
    func playMusic() {
        inputController?.audioPlayerForBackgroundMusic.play()
        musicStateButton.setBackgroundImage(UIImage(named: "musicOn"), for: .normal)
        UserDefaults.standard.set(true, forKey: "musicIsPlaying")
    }
    
    func stopMusic() {
        inputController?.audioPlayerForBackgroundMusic.stop()
        musicStateButton.setBackgroundImage(UIImage(named: "musicOff"), for: .normal)
        UserDefaults.standard.set(false, forKey: "musicIsPlaying")
    }
    
    @IBAction func musicStateAction(_ sender: UIButton) {
        if      (inputController?.audioPlayerForBackgroundMusic.isPlaying)! {
            stopMusic()
        } else {
            playMusic()
        }
    }
    
    override var prefersStatusBarHidden: Bool {//makes status bar visible in landscape mode
        return false
    }
}

