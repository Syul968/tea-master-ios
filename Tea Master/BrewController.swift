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
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var userTeas: [Tea]!
    var tea: Tea?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTeas = delegate.userTeas
        buildForm()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Brew view appeared")
        let teaRow = self.form.rowBy(tag: "tea")
        teaRow!.updateCell()
        teaRow!.reload()
    }
    
    func buildForm() {
        form +++ Section("Tea")
            
            <<< PushRow<Tea>() { row in
                row.tag = "tea"
                row.title = "Tea"
                row.options = userTeas
                
                row.displayValueFor = {
                    return "\($0?.name ?? "")"
                }
                
                row.onChange { selected in
                    print("Selected tea: \(selected.value!.name)")
                }
            }.cellUpdate { cell, row in
                if(self.tea != nil) {
                    row.value = self.tea
                }
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
        
            <<< PushRow<Float>() { row in
                row.tag = "brewRating"
                row.title = "Rating"
                
                row.options = [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
            }
        
            <<< TextAreaRow() { row in
                row.tag = "brewNotes"
                row.placeholder = "Comments"
            }
        
        +++ Section()
        
            <<< ButtonRow() { row in
                row.tag = "saveBrew"
                row.title = "Brew"
                
                row.onCellSelection(self.brew)
            }.cellSetup { cell, row in
                cell.textLabel?.textColor = UIColor(hex: 0x74B24B)
        }
    }
    
    func brew(button: ButtonCellOf<String>, row: ButtonRowOf<String>) {
        let alert = UIAlertController(title: "Saved", message: "Your brew was saved!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
}
