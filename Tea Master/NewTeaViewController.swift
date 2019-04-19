//
//  NewTea.swift
//  Tea Master
//
//  Created by Luis Flores on 4/18/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit
import Eureka

class NewTeaViewController: FormViewController {
    var tea: Tea?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        form +++ Section()
            <<< TextRow() { row in
                row.title = "Brand"
            }
            <<< TextRow() { row in
                row.title = "Name"
            }
        
        form +++ SelectableSection<ListCheckRow<String>>("Type", selectionType: .singleSelection(enableDeselection: true))
        let types = [ TeaType.black.rawValue, TeaType.green.rawValue, TeaType.white.rawValue, TeaType.tisane.rawValue, TeaType.other.rawValue ]
        
        for option in types {
            form.last! <<< ListCheckRow<String>(option){ listRow in
                listRow.title = option
                listRow.selectableValue = option
                listRow.value = nil
            }
        }
    }
}
