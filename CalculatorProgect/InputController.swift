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
    
    var audioPlayerForButtons = AVAudioPlayer()
    var audioPlayerForBackgroundMusic = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            audioPlayerForButtons = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "click_one", ofType: "wav")!))
            audioPlayerForButtons.prepareToPlay()
        }
        catch {
        print(error)
        }
        backgroundMusic()
    }
    
    func backgroundMusic() {
        do {
            audioPlayerForBackgroundMusic = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Marimba-music", ofType: "mp3")!))
            audioPlayerForBackgroundMusic.prepareToPlay()
            audioPlayerForBackgroundMusic.play()
        }
        catch {
            print(error)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func touchDigitAction(_ sender: UIButton) {
        audioPlayerForButtons.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func binaryOperationAction(_ sender: UIButton) {
        audioPlayerForButtons.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func unaryOperationAction(_ sender: UIButton) {
        audioPlayerForButtons.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func equalsAction(_ sender: UIButton) {
        audioPlayerForButtons.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        audioPlayerForButtons.play()
        buttonDidPress?(sender.currentTitle!)
    }
    
    @IBAction func dotAction(_ sender: UIButton) {
        audioPlayerForButtons.play()
        buttonDidPress?(sender.currentTitle!)
    }
}
