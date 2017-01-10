//
//  MenuNavigationViewController.swift
//  CalculatorProgect
//
//  Created by Yuriy Lubinets on 1/10/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class MenuNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.alpha = 0.25
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, animations: {//nav controller appears with this animation
            self.view.alpha = 1.0
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
