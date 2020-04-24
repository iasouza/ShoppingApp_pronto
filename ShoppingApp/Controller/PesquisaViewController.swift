//
//  PesquisaViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 24/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit

class PesquisaViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var pesquisaTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pesquisaTextField.delegate = self
        pesquisaTextField.text = ""
    }
    
    @IBAction func PesquisarBanda(_ sender: UIButton) {
        
        pesquisaTextField.endEditing(true)
        if let texto = pesquisaTextField.text{
            if texto != ""{
                DispatchQueue.main.async(){
                    self.performSegue(withIdentifier: "goToGaleria", sender: nil)
                    }
               
            }
        }
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            textField.placeholder = "Pesquisar"
            return true
        }else{
            textField.placeholder = "Type something!"
            return false
        }
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToGaleria"{
            let destinationVC = segue.destination as! GaleriaViewController
            destinationVC.nomeBandaTeste = pesquisaTextField.text
             pesquisaTextField.text = ""
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        pesquisaTextField.endEditing(true)
        if let texto = pesquisaTextField.text{
        if texto != ""{
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "goToGaleria", sender: nil)
            }
          
        }
       
    }
     return true
    }
}


