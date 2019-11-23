//
//  ViewController.swift
//  tipper
//
//  Created by dnlfmkn on 11/14/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let preferences = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        if (preferences.object(forKey: "mode") == nil) {
            preferences.set(0, forKey: "mode")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // load the default tip and mode
        overrideUserInterfaceStyle = preferences.integer(forKey: "mode") == 0 ? .light : .dark
        tipControl.selectedSegmentIndex = preferences.integer(forKey: "default_tip")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }

    @IBAction func validateBill(_ sender: Any) {
        let isInvalidBill = Double(billField.text!) == nil
        let empty = billField.text!.isEmpty
        if (empty || !isInvalidBill) {
        self.billField.layer.borderColor = UIColor.lightGray.cgColor
            self.billField.layer.borderWidth = 1
        } else {
            self.billField.layer.borderColor = UIColor.red.cgColor
            self.billField.layer.borderWidth = 2
        }
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        // obtain bill amount from field
        let bill = Double(billField.text!.trimmingCharacters(in: .whitespaces)) ?? 0
        
        // calculate tip and total
        let tips = [0.15, 0.18, 0.20]
        let tip = bill * tips[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}
