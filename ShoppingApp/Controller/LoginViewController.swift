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

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
