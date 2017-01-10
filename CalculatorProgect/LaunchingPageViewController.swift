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
            self.showMenuNavigationViewController()
        }
        //animations work imultaniouly with timer
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            
            self.launchingImage.transform = CGAffineTransform(scaleX: 5.25, y: 5.25)
            
        }) { (true) in
            UIView.animate(withDuration: 0.5, animations: { 
                
//                self.view.alpha = 0.0
                
            })
        }
    }
    
    func showMenuNavigationViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nav =  storyboard.instantiateViewController(withIdentifier: "MenuNavigationViewController") as! UINavigationController
        rootViewController = nav//making nav controller - root
        self.view.addSubview(nav.view)// adding nav controller as subview to launchPageContr
        nav.view.alpha = 0.0
        UIView.animate(withDuration: 0.5, animations: {//nav controller appears with this animation
            nav.view.alpha = 1.0
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
