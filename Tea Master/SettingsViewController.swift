//
//  SettingsViewController.swift
//  Tea Master
//
//  Created by Luis Flores on 5/3/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit
import Eureka
import SwiftKeychainWrapper

class SettingsViewController: FormViewController {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section()
            <<< ButtonRow() { row in
                row.tag = "logoutButton"
                row.title = "Log out"
                row.onCellSelection(self.logOut)
            }.cellUpdate { cell, row in
                cell.textLabel?.textColor = .red
            }
    }
    
    func logOut(cell: ButtonCellOf<String>, row: ButtonRow) {
        print("Should log out")
        if !KeychainWrapper.standard.removeObject(forKey: "token") {
            let alert: UIAlertController = UIAlertController(title: "Cannot log out", message: "We couldn't log you out :(", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        //  Token successfully removed
        performSegue(withIdentifier: "LoggedOut", sender: self)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
