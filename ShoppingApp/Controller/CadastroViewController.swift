//
//  CadastroViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 04/05/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit
import Firebase

class CadastroViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func Cadastrar(_ sender: UIButton) {
        if let email = emailTextField.text,       let password = senhaTextField.text, let nome = nomeTextField.text{
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in if let e = error {
            print(e.localizedDescription)
        }else{
            self.performSegue(withIdentifier:
                "goToSearch", sender: nil)
            self.defaults.set(nome, forKey: "nome")
            
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
