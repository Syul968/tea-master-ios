//
//  UIColor+HexInit.swift
//  Tea Master
//
//  Created by Luis Flores on 4/17/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Ivalid blue component")
        
        let redC = CGFloat(red) / 255.0
        let greenC = CGFloat(green) / 255.0
        let blueC = CGFloat(blue) / 255.0
        
        self.init(red: redC, green: greenC, blue: blueC, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
}
