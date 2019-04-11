//
//  Tea.swift
//  Tea Master
//
//  Created by Luis Flores on 4/10/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit

enum TeaType {
    case black
    case green
    case white
    case tisane
    case other
}

class Tea {
    var id: String?
    var brand: String
    var name: String
    var type: TeaType
    var isPublic: Bool
    
    init?(brand: String, name: String, type: TeaType, isPublic: Bool) {
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
    }
}
