//
//  ViewController.swift
//  Tea Master
//
//  Created by Luis Flores on 3/17/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit
import Apollo
import SwiftKeychainWrapper

class AuthwallViewController: UIViewController {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var apollo: ApolloClient!
    var teas: [Tea]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teas = delegate.userTeas
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let token: String? = KeychainWrapper.standard.string(forKey: "token")
        print("Token from authwall: \(token ?? ":/")")
        if token != nil {
            //  Verify token is valid with server
            self.delegate.updateApolloClient(token: token)
            apollo = self.delegate.apollo
            loadUserTeas { () -> () in
                self.performSegue(withIdentifier: "userHasToken", sender: self)
            }
            
        } else {
            self.delegate.updateApolloClient(token: nil)
        }
    }
    
    func loadUserTeas(completed: @escaping () -> ()) {
        print("Attemping to load user teas")
        let teasQuery = GetUserTeasQuery()
        
        apollo.fetch(query: teasQuery) { [weak self] result, error in
            guard let teas = result?.data?.userTeas else {
                return print("Apollo fetch guard failed")
            }
            
            if(result != nil) {
                print("Got teas from server")
            } else {
                print(">>> ERROR: \(error!)")
                fatalError("Error response from server")
            }
            
            self!.teas = teas.map { Tea(id: $0.id, brand: $0.brand, name: $0.name, type: TeaType(rawValue: $0.type)!, isPublic: false, rating: $0.rating)! }
            
            self!.delegate.userTeas = self!.teas
            print("Loaded teas")
            completed()
        }
    }

}
