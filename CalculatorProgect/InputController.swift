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
    
    var arrayWithColorSets = Array<ColorSet>()
    
    @IBOutlet var darkShadeButtons: [UIButton]!
    @IBOutlet var lightShadeButtons: [UIButton]!
    @IBOutlet weak var equalButtonOutlet: UIButton!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        settingTheme()
    }
    
    func settingTheme() {
        
        let objectFromUserDefaults = UserDefaults.standard.integer(forKey: "chosenColorSet")
        var colorSet = ColorSet()
        
        arrayWithColorSets = ColorSetGenerator.sharedInstance.generateColorSetsArray()
        colorSet = arrayWithColorSets[objectFromUserDefaults]
        
        self.view.backgroundColor = colorSet.colorD
        
        for button in darkShadeButtons {
            button.backgroundColor = colorSet.colorA
            button.titleLabel?.textColor = colorSet.colorD
        }
        
        for button in lightShadeButtons {
            button.backgroundColor = colorSet.colorB
            button.titleLabel?.textColor = colorSet.colorD
        }
        
        equalButtonOutlet.backgroundColor = colorSet.colorC
        equalButtonOutlet.titleLabel?.textColor = colorSet.colorD
        
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
