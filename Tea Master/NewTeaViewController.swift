//
//  NewTea.swift
//  Tea Master
//
//  Created by Luis Flores on 4/18/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit
import Eureka
import Apollo

class NewTeaViewController: FormViewController {
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var tea: Tea?
    var validationFlags = 0b000
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var apollo: ApolloClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        apollo = delegate.apollo
        let types = [ TeaType.black.rawValue, TeaType.green.rawValue, TeaType.white.rawValue, TeaType.tisane.rawValue, TeaType.other.rawValue ]
        
        saveButton.isEnabled = false
        form +++ Section("Tea details")
            <<< TextRow() { row in
                row.tag = "teaBrand"
                row.title = "Brand"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
            }.cellSetup { (cell, row) in
                cell.textField.autocorrectionType = .no
            }.cellUpdate { cell, row in
                if row.isValid {
                    self.validationFlags = self.validationFlags | 0b100
                    self.saveButton.isEnabled = self.validationFlags == 0b111
                } else {
                    self.validationFlags = self.validationFlags & 0b011
                }
            }
            <<< TextRow() { row in
                row.tag = "teaName"
                row.title = "Name"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
            }.cellSetup { (cell, row) in
                cell.textField.autocorrectionType = .no
            }.cellUpdate {cell, row in
                if row.isValid {
                    self.validationFlags = self.validationFlags | 0b010
                    self.saveButton.isEnabled = self.validationFlags == 0b111
                } else {
                    self.validationFlags = self.validationFlags & 0b101
                }
            }
            <<< PushRow<String>() {
                $0.tag = "teaType"
                $0.title = "Type"
                $0.options = types.map { $0 }
                let ruleRequiredViaClosure = RuleClosure<String> { rowValue in
                    guard let rowValue = rowValue else {
                        return(ValidationError(msg : "No type selected"))
                    }
                    if TeaType(rawValue: rowValue) != nil {
                        return nil
                    } else {
                        return ValidationError(msg: "Not a valid type")
                    }
                }
                $0.add(rule: ruleRequiredViaClosure)
                $0.validationOptions = .validatesOnDemand
            }.cellUpdate { cell, row in
                self.form.validate()
                if row.isValid {
                    self.validationFlags = self.validationFlags | 0b001
                    self.saveButton.isEnabled = self.validationFlags == 0b111
                } else {
                    self.validationFlags = self.validationFlags & 0b110
                }
            }.onPresent { form, selectorController in
                selectorController.enableDeselection = false
            }
            <<< SwitchRow() { row in
                row.tag = "isPublicTea"
                row.title = "Public"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            fatalError("Attempting to save from unexpected sender")
        }
        
        let formValues = form.values()
        let brand = formValues["teaBrand"] as! String
        let name = formValues["teaName"] as! String
        let type = formValues["teaType"] as! String
        var isPublic: Bool!
        
        if(formValues["isPublicTea"] as? Bool != nil) {
            isPublic = formValues["isPublicTea"] as? Bool
        } else {
            isPublic = false
        }
        let rating = 0.0
        
        apollo.perform(mutation: PostTeaMutation(brand: brand, name: name, type: type, isPublic: isPublic)) { (result, error) in
            if let error = error {
                print("Cannot post tea :( \(error)")
            }
            
        }
        
        tea = Tea(id: nil, brand: brand, name: name, type: TeaType(rawValue: type)!, isPublic: isPublic, rating: rating)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
