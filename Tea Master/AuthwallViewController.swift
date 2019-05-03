//
//  ViewController.swift
//  Tea Master
//
//  Created by Luis Flores on 3/17/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class AuthwallViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let token: String? = KeychainWrapper.standard.string(forKey: "token")
        print("Token from authwall: \(token ?? ":/")")
        if token != nil {
            //  Verify token is valid with server
            self.performSegue(withIdentifier: "userHasToken", sender: self)
        }
    }

}
