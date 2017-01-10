//
//  LaunchingPageViewController.swift
//  CalculatorProgect
//
//  Created by Yuriy Lubinets on 1/9/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class LaunchingPageViewController: UIViewController {
    
    fileprivate var rootViewController: UIViewController? = nil
    
    @IBOutlet weak var launchingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {//timer; when ends - nav controller is shown
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MenuNavigationViewController") as! UINavigationController
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
        //animations work simultaniouly with timer
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.launchingImage.transform = CGAffineTransform(scaleX: 5.25, y: 5.25)
        }) { (true) in
            UIView.animate(withDuration: 0.5, animations: {
                //                self.view.alpha = 0.0
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
