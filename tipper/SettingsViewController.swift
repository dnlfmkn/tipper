//
//  SettingsViewController.swift
//  tipper
//
//  Created by user160656 on 11/16/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let preferences = UserDefaults.standard //init defaults variable
    let tipOptions = [0.15, 0.18, 0.20]
    
    @IBOutlet weak var defaultTipChooser: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings" // set nav bar title to Settings
        defaultTipChooser.selectedSegmentIndex = preferences.integer(forKey: "default_tip")
    }
    
    // callback for default tip chooser
    @IBAction func onSelectDefaultTip(_ sender: Any) {        preferences.set(defaultTipChooser.selectedSegmentIndex, forKey: "default_tip") // obtain index of selected defult tip
        preferences.synchronize() // save defaults to disk
    }
}
