//
//  AppThemeTableViewCell.swift
//  CalculatorProgect
//
//  Created by Yuriy Lubinets on 1/9/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class AppThemeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colorSetImage: UIImageView!
    @IBOutlet weak var colorSetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
