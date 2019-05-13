//
//  ViewController.swift
//  Tea Master
//
//  Created by Luis Flores on 4/10/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit
import Eureka

class BrewController: FormViewController {
    var userTeas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDummyUserTeas()
        buildForm()
    }
    
    func buildForm() {
        form +++ Section("Tea")
            
            <<< PushRow<String>() { row in
                row.tag = "tea"
                row.title = "Tea"
                row.options = userTeas.map { $0 }
        }
        
        +++ Section("Brew")
        
            <<< DoublePickerInputRow<Int, Int>() { row in
                row.tag = "brewTime"
                row.title = "Time"
                
                row.firstOptions = { Array(0...59) }
                row.secondOptions = { _ in return Array(0...59) }
                
                row.displayValueForFirstRow = { a in return String(a) }
                row.displayValueForSecondRow = { b in return NSString(format: "%02d", b) as String }
            }
        
            <<< SliderRow() { row in
                row.tag = "brewTemperature"
                row.title = "Temperature"
                
                row.displayValueFor = {
                    return "\(Int($0 ?? 0)) ºC"
                }
            }.cellSetup { cell, row in
                row.value = 70.0
                cell.slider.minimumValue = 70
                cell.slider.maximumValue = 100
            }
        
            <<< DoublePickerInputRow<Int, Int>() { row in
                row.tag = "brewDose"
                row.title = "Dose"
                
                row.firstOptions = { Array(0...5) }
                row.secondOptions = { _ in return Array(0...9) }
            }
        
            <<< LabelRow() { row in
                row.tag = "brewRating"
                row.title = "0 Stars"
            }
        
            <<< TextAreaRow() { row in
                row.tag = "brewNotes"
                row.placeholder = "Comments"
            }
        
        +++ Section()
        
            <<< ButtonRow() { row in
                row.tag = "saveBrew"
                row.title = "Brew"
            }.cellSetup { cell, row in
                cell.textLabel?.textColor = UIColor(hex: 0x74B24B)
        }
    }
    
    func loadDummyUserTeas() {
        userTeas.append("English Breakfast")
        userTeas.append("Earl Grey")
        userTeas.append("Keemun")
        userTeas.append("Another dummy")
    }
    
    func loadUserTeas() {
        
    }
    
}
