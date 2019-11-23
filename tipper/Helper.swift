//
//  Helper.swift
//  tipper
//
//  Created by user160656 on 11/22/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    static let shared = Helper()
    
    func switchNavBarMode(shouldUseDarkMode: Bool) {
        let standard = UINavigationBar()
        standard.backgroundColor = shouldUseDarkMode ? UIColor.black : UIColor.white
        standard.tintColor = shouldUseDarkMode ? UIColor.black : UIColor.white
    }
}
