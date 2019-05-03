//
//  LoginViewController.swift
//  Tea Master
//
//  Created by Luis Flores on 4/24/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit
import Apollo

class LoginViewController: UIViewController {
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var apollo: ApolloClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.shadowImage = UIImage()
        userField.becomeFirstResponder()
        
        apollo = delegate.apollo
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        apollo.perform(mutation: LoginMutation(user: userField.text!, password: passField.text!)) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                
                let alert = UIAlertController(title: "Something went wrong :(", message: "There was a problem while trying to log you in.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                return
            }
            
            if let token = result?.data?.login {
                print("Logged in")
                print("Token: \(token)") // Should save to device
                self.performSegue(withIdentifier: "letUserIn", sender: self)
            } else {
                print(">>> Wrong credentials!")
                
                let alert = UIAlertController(title: "Wrong credentials", message: "The credentials you provided are not valid.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) in
                    self.passField.text = ""
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
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
