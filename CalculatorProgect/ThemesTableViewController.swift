//
//  ThemesTableViewController.swift
//  CalculatorProgect
//
//  Created by Yuriy Lubinets on 1/5/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class ThemesTableViewController: UITableViewController {
    @IBOutlet var themesTableView: UITableView!
    
    var arrayWithColorSets = Array<ColorSet>()
    var rowIsChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayWithColorSets = ColorSetGenerator.sharedInstance.generateColorSetsArray()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWithColorSets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! AppThemeTableViewCell
        
        let currentSet = arrayWithColorSets[indexPath.row]
        cell.colorSetLabel?.text = currentSet.setName
        cell.colorSetImage?.image = UIImage.init(named: currentSet.setIcon)
        cell.colorSetImage?.layer.cornerRadius = 25//making imageView round
        cell.colorSetImage?.layer.masksToBounds = true
        
        //the code below - gets info on Checkmark and presents it in table view
        let selectedRow = UserDefaults.standard.integer(forKey: "chosenColorSet")
        rowIsChecked = UserDefaults.standard.bool(forKey: "rowIsChecked")
        
        if (indexPath.row == selectedRow) && rowIsChecked  {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
 
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)//highlights for a second
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            UserDefaults.standard.set(indexPath.row, forKey: "chosenColorSet")
            UserDefaults.standard.set(true, forKey: "rowIsChecked")
            tableView.reloadData()
        }
    }
}
