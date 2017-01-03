//
//  InputController.swift
//  CalculatorProgect
//
//  Created by AdminAccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit
import AVFoundation

class InputController: UIViewController, InputInterface {
    
    var buttonDidPress: ((_ operation: String)->())? = nil
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "click_one", ofType: "wav")!))
            audioPlayer.prepareToPlay()
        }
        catch {
        print(error)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func touchDigitAction(_ sender: UIButton) {
        audioPlayer.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func binaryOperationAction(_ sender: UIButton) {
        audioPlayer.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func unaryOperationAction(_ sender: UIButton) {
        audioPlayer.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func equalsAction(_ sender: UIButton) {
        audioPlayer.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        audioPlayer.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func dotAction(_ sender: UIButton) {
        audioPlayer.play()
        buttonDidPress?(sender.currentTitle!)
    }
}
