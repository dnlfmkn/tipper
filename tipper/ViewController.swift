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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        // obtain bill amount from field
        let bill = Double(billField.text!) ?? 0
        
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

