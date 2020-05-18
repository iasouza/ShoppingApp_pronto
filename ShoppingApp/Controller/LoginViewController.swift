//
//  LoginViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 04/05/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func FazerLogin(_ sender: UIButton) {
        if let email = emailTextField.text, let password = senhaTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: "goToSearchAgain", sender: nil)
                }
            }
            
        }
        
    }
    
}
