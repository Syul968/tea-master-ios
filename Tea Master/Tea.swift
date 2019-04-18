//
//  Tea.swift
//  Tea Master
//
//  Created by Luis Flores on 4/10/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit

enum TeaType: String {
    case black = "Black"
    case green = "Green"
    case white = "White"
    case tisane = "Tisane"
    case other = "Other"
}

class Tea {
    var id: String?
    var brand: String
    var name: String
    var type: TeaType
    var isPublic: Bool
    var rating: Double
    
    init?(brand: String, name: String, type: TeaType, isPublic: Bool, rating: Double) {
        if(brand.isEmpty) {
            return nil
        }
        if(name.isEmpty) {
            return nil
        }
        
        self.brand = brand
        self.name = name
        self.type = type
        self.isPublic = isPublic
        self.rating = rating
    }
}
